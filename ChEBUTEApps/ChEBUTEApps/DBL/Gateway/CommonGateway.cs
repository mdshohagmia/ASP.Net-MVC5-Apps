﻿using System.Data.SqlClient;
using System.Web.Configuration;

namespace ChEBUTEApps.DBL.Gateway
{
    public class CommonGateway
    {
        private readonly string _connectionString =
           WebConfigurationManager.ConnectionStrings["ChEBUETDB"].ConnectionString;

        public SqlConnection Connection { get; set; }
        public SqlCommand Command { get; set; }
        public SqlDataReader Reader { get; set; }
        public string Query { get; set; }

        public CommonGateway()
        {
            Connection = new SqlConnection(_connectionString);
        }
    }
}