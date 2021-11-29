using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApp
{
    public class tbl_Product_Validation
    {
        [Required(ErrorMessage = "Please Enter your Name")]
        [Display(Name = "Product Name")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Please Enter Description")]
        [Display(Name = "Product Description")]
        public string Description { get; set; }
    }

   //[MetadataType(typeof(tbl_Product_Validation))]
    //public partial class tbl_Product
    //{

    //}
}