using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
  public  class Cart
    {
      public string Game_Genre { get; set;  }
      public string Game_Name { get; set; }
      public double Game_Price { get; set; }
      public string Game_Img { get; set; }
      public int User_id { get; set; }
      public int Status { get; set; }
      public int Quantity { get; set; }

    }
}
