using FitnessAppAPI.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FitnessAppAPI.Data
{
    public class UserContext : DbContext
    {

        // an empty constructor
        public UserContext() { }

        // base(options) calls the base class's constructor,
        // in this case, our base class is DbContext
        public UserContext(DbContextOptions<UserContext> options) : base(options) {}

        // Use DbSet<User> to query or read and 
        // write information about A User
        public DbSet<User> User { get; set; }
        public static System.Collections.Specialized.NameValueCollection AppSettings { get; }

        // configure the database to be used by this context
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            IConfigurationRoot configuration = new ConfigurationBuilder()
            .SetBasePath(AppDomain.CurrentDomain.BaseDirectory)
            .AddJsonFile("appsettings.json")
            .Build();

            // fitnessAppConnection is the name of the key that
            // contains the has the connection string as the value
            optionsBuilder.UseSqlServer(configuration.GetConnectionString("fitnessAppConnection"));
            
        }
    }
}
