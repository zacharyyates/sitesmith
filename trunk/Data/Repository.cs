/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software Company
 * 12/22/2008 4:52 PM
 */

using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;

namespace YatesMorrison.SiteSmith.Data
{
	public class Repository<T, D> : IRepository<T>, IDisposable
		where T : class
		where D : DataContext
	{
		public Repository()
		{
			Context = Activator.CreateInstance<D>();
		}

		public IEnumerable<T> All()
		{
			return Table;
		}

		public IEnumerable<T> All(Func<T, bool> exp)
		{
			return Table.Where(exp);
		}

		public T Single(Func<T, bool> exp)
		{
			return Table.Single(exp);
		}

		public T First(Func<T, bool> exp)
		{
			return Table.First(exp);
		}

		public void DeleteOnSubmit(T entity)
		{
			Table.DeleteOnSubmit(entity);
		}

		public T New()
		{
			T entity = default(T);
			Table.InsertOnSubmit(entity);
			return entity;
		}

		public void SubmitChanges()
		{
			Context.SubmitChanges();
		}

		protected Table<T> Table
		{
			get { return Context.GetTable<T>(); }
		}

		protected D Context
		{
			get { return m_Context; }
			set { m_Context = value; }
		}
		D m_Context;

		ReadOnlyCollection<MetaDataMember> PrimaryKeyNames
		{
			get { return TableMetadata.RowType.IdentityMembers; }
		}

		MetaTable TableMetadata
		{
			get { return Context.Mapping.GetTable(typeof(T)); }
		}

		MetaType ClassMetadata
		{
			get { return Context.Mapping.GetMetaType(typeof(T)); }
		}

		// Dispose() calls Dispose(true)
		public void Dispose()
		{
			Dispose(true);
			GC.SuppressFinalize(this);
		}

		// The bulk of the clean-up code is implemented in Dispose(bool)
		protected virtual void Dispose(bool disposing)
		{
			if (disposing)
			{
				// free managed resources
				if (m_Context != null)
				{
					m_Context.Dispose();
					m_Context = null;
				}
			}
		}
	}

	public class Repository<T> : Repository<T, DataContext>
		where T : class
	{
		public Repository(DataContext context)
		{
			if (context != null)
			{
				Context = context;
			}
			else
			{
				throw new NullReferenceException("Context cannot be null.");
			}
		}
	}
}