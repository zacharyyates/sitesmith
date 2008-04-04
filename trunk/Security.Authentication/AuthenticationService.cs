/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 4/4/2008 3:06:07 PM
 */

using System;

namespace YatesMorrison.Security.Authentication
{
	public class AuthenticationService
	{
		public void CreateUser(User user)
		{
			using (AuthenticationDataContext context = new AuthenticationDataContext())
			{
				context.Users.InsertOnSubmit(user);
				context.SubmitChanges();
			}
		}

		public void DeleteUser(User user)
		{
			using (AuthenticationDataContext context = new AuthenticationDataContext())
			{
				context.Users.Attach(user);
				context.Users.DeleteOnSubmit(user);
				context.SubmitChanges();
			}
		}
	}
}