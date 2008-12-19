/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 4/4/2008 1:22:09 PM
 */

using System;

namespace YatesMorrison.SiteSmith.Data
{
	public interface IIdentifiable
	{
		Guid Id { get; set; }
	}
}