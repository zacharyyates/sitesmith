﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.1433
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace YatesMorrison.Security.Authorization
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[System.Data.Linq.Mapping.DatabaseAttribute(Name="SiteSmith.Authorization")]
	public partial class AuthorizationDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertAction(Action instance);
    partial void UpdateAction(Action instance);
    partial void DeleteAction(Action instance);
    partial void InsertSecurable(Securable instance);
    partial void UpdateSecurable(Securable instance);
    partial void DeleteSecurable(Securable instance);
    partial void InsertActor(Actor instance);
    partial void UpdateActor(Actor instance);
    partial void DeleteActor(Actor instance);
    partial void InsertPermission(Permission instance);
    partial void UpdatePermission(Permission instance);
    partial void DeletePermission(Permission instance);
    #endregion
		
		public AuthorizationDataContext() : 
				base(global::YatesMorrison.Security.Authorization.Properties.Settings.Default.SiteSmith_AuthorizationConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public AuthorizationDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public AuthorizationDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public AuthorizationDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public AuthorizationDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<Action> Actions
		{
			get
			{
				return this.GetTable<Action>();
			}
		}
		
		public System.Data.Linq.Table<Securable> Securables
		{
			get
			{
				return this.GetTable<Securable>();
			}
		}
		
		public System.Data.Linq.Table<Actor> Actors
		{
			get
			{
				return this.GetTable<Actor>();
			}
		}
		
		public System.Data.Linq.Table<Permission> Permissions
		{
			get
			{
				return this.GetTable<Permission>();
			}
		}
	}
	
	[Table(Name="dbo.Action")]
	public partial class Action : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private System.Guid _ActionId;
		
		private System.Nullable<System.Guid> _ParentIdFk;
		
		private string _Name;
		
		private EntitySet<Permission> _Permissions;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnActionIdChanging(System.Guid value);
    partial void OnActionIdChanged();
    partial void OnParentIdFkChanging(System.Nullable<System.Guid> value);
    partial void OnParentIdFkChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    #endregion
		
		public Action()
		{
			this._Permissions = new EntitySet<Permission>(new Action<Permission>(this.attach_Permissions), new Action<Permission>(this.detach_Permissions));
			OnCreated();
		}
		
		[Column(Storage="_ActionId", DbType="UniqueIdentifier NOT NULL", IsPrimaryKey=true)]
		public System.Guid ActionId
		{
			get
			{
				return this._ActionId;
			}
			set
			{
				if ((this._ActionId != value))
				{
					this.OnActionIdChanging(value);
					this.SendPropertyChanging();
					this._ActionId = value;
					this.SendPropertyChanged("ActionId");
					this.OnActionIdChanged();
				}
			}
		}
		
		[Column(Storage="_ParentIdFk", DbType="UniqueIdentifier")]
		public System.Nullable<System.Guid> ParentIdFk
		{
			get
			{
				return this._ParentIdFk;
			}
			set
			{
				if ((this._ParentIdFk != value))
				{
					this.OnParentIdFkChanging(value);
					this.SendPropertyChanging();
					this._ParentIdFk = value;
					this.SendPropertyChanged("ParentIdFk");
					this.OnParentIdFkChanged();
				}
			}
		}
		
		[Column(Storage="_Name", DbType="NVarChar(MAX)")]
		public string Name
		{
			get
			{
				return this._Name;
			}
			set
			{
				if ((this._Name != value))
				{
					this.OnNameChanging(value);
					this.SendPropertyChanging();
					this._Name = value;
					this.SendPropertyChanged("Name");
					this.OnNameChanged();
				}
			}
		}
		
		[Association(Name="Action_Permission", Storage="_Permissions", OtherKey="ActionIdFk")]
		public EntitySet<Permission> Permissions
		{
			get
			{
				return this._Permissions;
			}
			set
			{
				this._Permissions.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Permissions(Permission entity)
		{
			this.SendPropertyChanging();
			entity.Action = this;
		}
		
		private void detach_Permissions(Permission entity)
		{
			this.SendPropertyChanging();
			entity.Action = null;
		}
	}
	
	[Table(Name="dbo.Securable")]
	public partial class Securable : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private System.Guid _SecurableId;
		
		private System.Nullable<System.Guid> _ParentIdFk;
		
		private string _Name;
		
		private EntitySet<Permission> _Permissions;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnSecurableIdChanging(System.Guid value);
    partial void OnSecurableIdChanged();
    partial void OnParentIdFkChanging(System.Nullable<System.Guid> value);
    partial void OnParentIdFkChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    #endregion
		
		public Securable()
		{
			this._Permissions = new EntitySet<Permission>(new Action<Permission>(this.attach_Permissions), new Action<Permission>(this.detach_Permissions));
			OnCreated();
		}
		
		[Column(Storage="_SecurableId", DbType="UniqueIdentifier NOT NULL", IsPrimaryKey=true)]
		public System.Guid SecurableId
		{
			get
			{
				return this._SecurableId;
			}
			set
			{
				if ((this._SecurableId != value))
				{
					this.OnSecurableIdChanging(value);
					this.SendPropertyChanging();
					this._SecurableId = value;
					this.SendPropertyChanged("SecurableId");
					this.OnSecurableIdChanged();
				}
			}
		}
		
		[Column(Storage="_ParentIdFk", DbType="UniqueIdentifier")]
		public System.Nullable<System.Guid> ParentIdFk
		{
			get
			{
				return this._ParentIdFk;
			}
			set
			{
				if ((this._ParentIdFk != value))
				{
					this.OnParentIdFkChanging(value);
					this.SendPropertyChanging();
					this._ParentIdFk = value;
					this.SendPropertyChanged("ParentIdFk");
					this.OnParentIdFkChanged();
				}
			}
		}
		
		[Column(Storage="_Name", DbType="NVarChar(MAX)")]
		public string Name
		{
			get
			{
				return this._Name;
			}
			set
			{
				if ((this._Name != value))
				{
					this.OnNameChanging(value);
					this.SendPropertyChanging();
					this._Name = value;
					this.SendPropertyChanged("Name");
					this.OnNameChanged();
				}
			}
		}
		
		[Association(Name="Securable_Permission", Storage="_Permissions", OtherKey="SecurableIdFk")]
		public EntitySet<Permission> Permissions
		{
			get
			{
				return this._Permissions;
			}
			set
			{
				this._Permissions.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Permissions(Permission entity)
		{
			this.SendPropertyChanging();
			entity.Securable = this;
		}
		
		private void detach_Permissions(Permission entity)
		{
			this.SendPropertyChanging();
			entity.Securable = null;
		}
	}
	
	[Table(Name="dbo.Actor")]
	public partial class Actor : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private System.Guid _ActorId;
		
		private System.Nullable<System.Guid> _ParentIdFk;
		
		private string _UserIdentifier;
		
		private EntitySet<Permission> _Permissions;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnActorIdChanging(System.Guid value);
    partial void OnActorIdChanged();
    partial void OnParentIdFkChanging(System.Nullable<System.Guid> value);
    partial void OnParentIdFkChanged();
    partial void OnUserIdentifierChanging(string value);
    partial void OnUserIdentifierChanged();
    #endregion
		
		public Actor()
		{
			this._Permissions = new EntitySet<Permission>(new Action<Permission>(this.attach_Permissions), new Action<Permission>(this.detach_Permissions));
			OnCreated();
		}
		
		[Column(Storage="_ActorId", DbType="UniqueIdentifier NOT NULL", IsPrimaryKey=true)]
		public System.Guid ActorId
		{
			get
			{
				return this._ActorId;
			}
			set
			{
				if ((this._ActorId != value))
				{
					this.OnActorIdChanging(value);
					this.SendPropertyChanging();
					this._ActorId = value;
					this.SendPropertyChanged("ActorId");
					this.OnActorIdChanged();
				}
			}
		}
		
		[Column(Storage="_ParentIdFk", DbType="UniqueIdentifier")]
		public System.Nullable<System.Guid> ParentIdFk
		{
			get
			{
				return this._ParentIdFk;
			}
			set
			{
				if ((this._ParentIdFk != value))
				{
					this.OnParentIdFkChanging(value);
					this.SendPropertyChanging();
					this._ParentIdFk = value;
					this.SendPropertyChanged("ParentIdFk");
					this.OnParentIdFkChanged();
				}
			}
		}
		
		[Column(Storage="_UserIdentifier", DbType="NVarChar(255)")]
		public string UserIdentifier
		{
			get
			{
				return this._UserIdentifier;
			}
			set
			{
				if ((this._UserIdentifier != value))
				{
					this.OnUserIdentifierChanging(value);
					this.SendPropertyChanging();
					this._UserIdentifier = value;
					this.SendPropertyChanged("UserIdentifier");
					this.OnUserIdentifierChanged();
				}
			}
		}
		
		[Association(Name="Actor_Permission", Storage="_Permissions", OtherKey="ActorIdFk")]
		public EntitySet<Permission> Permissions
		{
			get
			{
				return this._Permissions;
			}
			set
			{
				this._Permissions.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Permissions(Permission entity)
		{
			this.SendPropertyChanging();
			entity.Actor = this;
		}
		
		private void detach_Permissions(Permission entity)
		{
			this.SendPropertyChanging();
			entity.Actor = null;
		}
	}
	
	[Table(Name="dbo.Permission")]
	public partial class Permission : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private System.Guid _ActorIdFk;
		
		private System.Guid _ActionIdFk;
		
		private System.Guid _SecurableIdFk;
		
		private System.Nullable<bool> _IsAllowed;
		
		private EntityRef<Action> _Action;
		
		private EntityRef<Actor> _Actor;
		
		private EntityRef<Securable> _Securable;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnActorIdFkChanging(System.Guid value);
    partial void OnActorIdFkChanged();
    partial void OnActionIdFkChanging(System.Guid value);
    partial void OnActionIdFkChanged();
    partial void OnSecurableIdFkChanging(System.Guid value);
    partial void OnSecurableIdFkChanged();
    partial void OnIsAllowedChanging(System.Nullable<bool> value);
    partial void OnIsAllowedChanged();
    #endregion
		
		public Permission()
		{
			this._Action = default(EntityRef<Action>);
			this._Actor = default(EntityRef<Actor>);
			this._Securable = default(EntityRef<Securable>);
			OnCreated();
		}
		
		[Column(Storage="_ActorIdFk", DbType="UniqueIdentifier NOT NULL", IsPrimaryKey=true)]
		public System.Guid ActorIdFk
		{
			get
			{
				return this._ActorIdFk;
			}
			set
			{
				if ((this._ActorIdFk != value))
				{
					if (this._Actor.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnActorIdFkChanging(value);
					this.SendPropertyChanging();
					this._ActorIdFk = value;
					this.SendPropertyChanged("ActorIdFk");
					this.OnActorIdFkChanged();
				}
			}
		}
		
		[Column(Storage="_ActionIdFk", DbType="UniqueIdentifier NOT NULL", IsPrimaryKey=true)]
		public System.Guid ActionIdFk
		{
			get
			{
				return this._ActionIdFk;
			}
			set
			{
				if ((this._ActionIdFk != value))
				{
					if (this._Action.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnActionIdFkChanging(value);
					this.SendPropertyChanging();
					this._ActionIdFk = value;
					this.SendPropertyChanged("ActionIdFk");
					this.OnActionIdFkChanged();
				}
			}
		}
		
		[Column(Storage="_SecurableIdFk", DbType="UniqueIdentifier NOT NULL", IsPrimaryKey=true)]
		public System.Guid SecurableIdFk
		{
			get
			{
				return this._SecurableIdFk;
			}
			set
			{
				if ((this._SecurableIdFk != value))
				{
					if (this._Securable.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnSecurableIdFkChanging(value);
					this.SendPropertyChanging();
					this._SecurableIdFk = value;
					this.SendPropertyChanged("SecurableIdFk");
					this.OnSecurableIdFkChanged();
				}
			}
		}
		
		[Column(Storage="_IsAllowed", DbType="Bit")]
		public System.Nullable<bool> IsAllowed
		{
			get
			{
				return this._IsAllowed;
			}
			set
			{
				if ((this._IsAllowed != value))
				{
					this.OnIsAllowedChanging(value);
					this.SendPropertyChanging();
					this._IsAllowed = value;
					this.SendPropertyChanged("IsAllowed");
					this.OnIsAllowedChanged();
				}
			}
		}
		
		[Association(Name="Action_Permission", Storage="_Action", ThisKey="ActionIdFk", IsForeignKey=true, DeleteOnNull=true, DeleteRule="CASCADE")]
		public Action Action
		{
			get
			{
				return this._Action.Entity;
			}
			set
			{
				Action previousValue = this._Action.Entity;
				if (((previousValue != value) 
							|| (this._Action.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Action.Entity = null;
						previousValue.Permissions.Remove(this);
					}
					this._Action.Entity = value;
					if ((value != null))
					{
						value.Permissions.Add(this);
						this._ActionIdFk = value.ActionId;
					}
					else
					{
						this._ActionIdFk = default(System.Guid);
					}
					this.SendPropertyChanged("Action");
				}
			}
		}
		
		[Association(Name="Actor_Permission", Storage="_Actor", ThisKey="ActorIdFk", IsForeignKey=true, DeleteOnNull=true, DeleteRule="CASCADE")]
		public Actor Actor
		{
			get
			{
				return this._Actor.Entity;
			}
			set
			{
				Actor previousValue = this._Actor.Entity;
				if (((previousValue != value) 
							|| (this._Actor.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Actor.Entity = null;
						previousValue.Permissions.Remove(this);
					}
					this._Actor.Entity = value;
					if ((value != null))
					{
						value.Permissions.Add(this);
						this._ActorIdFk = value.ActorId;
					}
					else
					{
						this._ActorIdFk = default(System.Guid);
					}
					this.SendPropertyChanged("Actor");
				}
			}
		}
		
		[Association(Name="Securable_Permission", Storage="_Securable", ThisKey="SecurableIdFk", IsForeignKey=true, DeleteOnNull=true, DeleteRule="CASCADE")]
		public Securable Securable
		{
			get
			{
				return this._Securable.Entity;
			}
			set
			{
				Securable previousValue = this._Securable.Entity;
				if (((previousValue != value) 
							|| (this._Securable.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Securable.Entity = null;
						previousValue.Permissions.Remove(this);
					}
					this._Securable.Entity = value;
					if ((value != null))
					{
						value.Permissions.Add(this);
						this._SecurableIdFk = value.SecurableId;
					}
					else
					{
						this._SecurableIdFk = default(System.Guid);
					}
					this.SendPropertyChanged("Securable");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
