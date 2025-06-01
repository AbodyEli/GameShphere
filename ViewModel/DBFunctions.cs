using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.OleDb;


namespace ViewModel
{
    public class DBFunctions
    {
        protected OleDbConnection conObj;
        protected OleDbCommand cmd;

        public DBFunctions() {
            conObj = new OleDbConnection();
            cmd = new OleDbCommand();

                }
        private string Path()
        {
            string currentDir = Environment.CurrentDirectory;
            string[] dirstir = currentDir.Split('\\');
            int index = dirstir.Length-3;
            dirstir[index] = "ViewModel";
            Array.Resize(ref dirstir,index+1);
            string pathStr = String.Join("\\", dirstir);
            return pathStr;

        }
        public OleDbCommand GenerateOleDBCommand(string sqlStr, string dbFileName)
        {
            conObj = GenerateConnection(dbFileName);
            cmd = new OleDbCommand(sqlStr, conObj);
            return cmd;
        }
        public OleDbConnection GenerateConnection(string dbFileName)
        {
            conObj.ConnectionString = "Provider=Microsoft.Ace.OlEDB.12.0; Data Source=" +
                Path() + "//App_Data//" + dbFileName;
    return conObj;
        }
        public int changetable(string sqlString, string dbFileName)
        {
            int records = 0;
            cmd = GenerateOleDBCommand(sqlString, dbFileName);
            conObj.Open();
            records = cmd.ExecuteNonQuery();
            conObj.Close();
            return records;
        }
        public DataSet Select(string sqlString, string dbFileName)
        {
            conObj = GenerateConnection(dbFileName);
            DataSet ds = new DataSet();
            OleDbDataAdapter da = new OleDbDataAdapter(sqlString, conObj);
            conObj.Open();
            da.Fill(ds);
            conObj.Close();
            return ds;
        }
    }
}
    

