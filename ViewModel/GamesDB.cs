using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Security.Policy;

namespace ViewModel
{
    public class GamesDB : DBFunctions
    {
        DBFunctions Gamesdb = new DBFunctions();
        public DataSet GetDataSet(string SqlStr)
        {
            return Gamesdb.Select(SqlStr, "DBGameSpherePJ.accdb");
        }

    }
}
