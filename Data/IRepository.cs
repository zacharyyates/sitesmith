/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software Company
 * 12/22/2008 4:48 PM
 */

using System;
using System.Collections.Generic;

namespace YatesMorrison.SiteSmith.Data
{
	public interface IRepository<T>
		where T : class
	{
		/// <summary>
		/// Return all instances of type T.
		/// </summary>
		IEnumerable<T> All();

		/// <summary>
		/// Return all instances of type T that match the expression exp.
		/// </summary>
		IEnumerable<T> All(Func<T, bool> exp);

		/// <summary>
		/// Returns the single entity matching the expression. Throws an exception if there is not exactly one such entity.
		/// </summary>
		T Single(Func<T, bool> exp);

		/// <summary>
		/// Returns the first element satisfying the condition.
		/// </summary>
		T First(Func<T, bool> exp);

		/// <summary>
		/// Mark an entity to be deleted on SubmitChanges().
		/// </summary>
		void DeleteOnSubmit(T entity);

		/// <summary>
		/// Create a new instance of type T.
		/// </summary>
		T New();

		/// <summary>
		/// Submit changes to the data context.
		/// </summary>
		void SubmitChanges();
	}
}