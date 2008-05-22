/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 4/4/2008 1:22:09 PM
 */

using System;
using System.Data.Linq;
using System.Linq;

namespace YatesMorrison.SiteSmith.Data
{
	#region Enums
	public enum MediaType
	{
		Image = 0,
		Video = 1
	}
	#endregion

	#region Interfaces
	public interface IIdentifiable
	{
		Guid Id { get; set; }
	}

	public interface INameable
	{
		string Name { get; set; }
	}
	#endregion

	public partial class Tag : INameable, IIdentifiable { }

	partial class SiteSmithDataContext
	{
		/// <summary>
		/// Inserts a single value into a lookup table, returns the ID of the record if it exists
		/// </summary>
		public Guid SingletonInsert<T>( T entity )
			where T : class, INameable, IIdentifiable
		{
			Table<T> table = GetTable<T>();
			T match = table.FirstOrDefault(e => e.Name.Equals(entity.Name));
			if (match != null)
			{
				return match.Id;
			}
			else
			{
				entity.Id = Guid.NewGuid();
				table.InsertOnSubmit(entity);
				SubmitChanges();
				return entity.Id;
			}
		}
	}
}