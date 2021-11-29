using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApp.Models;

namespace WebApp.Controllers
{
    public class AuthenticationController : Controller
    {
        // GET: Authentication
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(tbl_User user)
        {
            WebAppEntities db = new WebAppEntities();
            db.tbl_User.Add(user);
            db.SaveChanges();
            return RedirectToAction("UserList");
        }

        //public ActionResult UserList(string SortOrder, string SortBy,int PageNumber=1)
        //{
        //    WebAppEntities db = new WebAppEntities();

        //    ViewBag.SortOrder = SortOrder;
        //    ViewBag.SortBy = SortBy;
           

        //    var userList = db.tbl_User.ToList();


        //    //Call bellow method
        //    ApplySorting(SortOrder, SortBy, userList);
        //    userList = ApplyPagination(userList, PageNumber);

        //    //Ata sudu Acending & Decending er jonno

        //    //switch (SortOrder)
        //    //{
        //    //    case "Asc":
        //    //        {
        //    //            userList = userList.OrderBy(x => x.UserName).ToList();
        //    //            break;
        //    //        }
        //    //    case "Desc":
        //    //        {
        //    //            userList = userList.OrderByDescending(x => x.UserName).ToList();
        //    //            break;
        //    //        }
        //    //    default:
        //    //        {
        //    //            userList = userList.OrderBy(x => x.UserName).ToList();
        //    //            break;
        //    //        }
        //    //}




        //    //userList = userList.Skip(2).ToList();  //first jotota skip kortea cai tar jonno ai condition ta (Paignation)
        //    //userList = userList.Skip(2).Take(1).ToList();
        //    //userList = userList.Take(1).ToList();

        //    ViewBag.TotalPages = Math.Ceiling(userList.Count() / 2.0);

        //    ViewBag.PageNumber = PageNumber;



        //    // userList = userList.Skip((PageNumber-1)*2).Take(1).ToList();
        //    userList = userList.Take(3).ToList();
        //    //Skip somikoron
        //    //1-1=0*2=0
        //    //2-1=1*2=2
            
            
        //    return View(userList);
        //}

        //[HttpPost]
        //public ActionResult UserList(string searchText)
        //{
        //    WebAppEntities db = new WebAppEntities();
        //    var userList = db.tbl_User.ToList();

        //    if (searchText !=null)
        //    {
        //        //userList = db.tbl_User.Where(x => x.UserName == searchText).ToList(); //ata holo exect match show er jonno means jeta search korbo seta asbe
        //        userList = db.tbl_User.Where(x => x.UserName.Contains(searchText) || x.Email.Contains(searchText) || x.Password.Contains(searchText)).ToList();  //ata holo a likle all a show korbe

        //    }

        //    return View(userList);
        //}

        public void ApplySorting(string SortOrder, string SortBy, List<tbl_User> userList)
        {

            //ATA JOTO GULA ROW THAKBE SETAR ASCENDING OR DECENDING ER JONNO (Searcing)

            switch (SortBy)
            {
                case "UserName":
                    {
                        switch (SortOrder)
                        {
                            case "Asc":
                                {
                                    userList = userList.OrderBy(x => x.UserName).ToList();
                                    break;
                                }
                            case "Desc":
                                {
                                    userList = userList.OrderByDescending(x => x.UserName).ToList();
                                    break;
                                }
                            default:
                                {
                                    userList = userList.OrderBy(x => x.UserName).ToList();
                                    break;
                                }
                        }
                        break;
                    }
                case "Email":
                    {
                        switch (SortOrder)
                        {
                            case "Asc":
                                {
                                    userList = userList.OrderBy(x => x.Email).ToList();
                                    break;
                                }
                            case "Desc":
                                {
                                    userList = userList.OrderByDescending(x => x.Email).ToList();
                                    break;
                                }
                            default:
                                {
                                    userList = userList.OrderBy(x => x.Email).ToList();
                                    break;
                                }
                        }
                        break;

                    }
                case "Password":
                    {
                        switch (SortOrder)
                        {
                            case "Asc":
                                {
                                    userList = userList.OrderBy(x => x.Password).ToList();
                                    break;
                                }
                            case "Desc":
                                {
                                    userList = userList.OrderByDescending(x => x.Password).ToList();
                                    break;
                                }
                            default:
                                {
                                    userList = userList.OrderBy(x => x.Password).ToList();
                                    break;
                                }
                        }
                        break;
                    }
                case "Gender":
                    {
                        switch (SortOrder)
                        {
                            case "Asc":
                                {
                                    userList = userList.OrderBy(x => x.Gender).ToList();
                                    break;
                                }
                            case "Desc":
                                {
                                    userList = userList.OrderByDescending(x => x.Gender).ToList();
                                    break;
                                }
                            default:
                                {
                                    userList = userList.OrderByDescending(x => x.Gender).ToList();
                                    break;
                                }
                        }
                        break;
                    }
                default:
                    {
                        userList = userList.OrderBy(x => x.UserName).ToList();
                        break;
                    }
            }
        }
        
        
        public List<tbl_User> ApplyPagination(List<tbl_User> userList, int PageNumber = 1)
        {
            ViewBag.TotalPages = Math.Ceiling(userList.Count() / 2.0);

            ViewBag.PageNumber = PageNumber;

            userList = userList.Take(3).ToList();
            return userList;
        }
        
       
        
        
        
        [AcceptVerbs(HttpVerbs.Get | HttpVerbs.Post)]  //ata line er mane holo ata get & post both method er kaj korbe
        public ActionResult UserList(string searchText, string SortOrder, string SortBy, int PageNumber = 1)
        {
            WebAppEntities db = new WebAppEntities();
            ViewBag.SortOrder = SortOrder;
            ViewBag.SortBy = SortBy;
            var userList = db.tbl_User.ToList();
            if (searchText !=null)
            {
                userList = db.tbl_User.Where(x => x.UserName.Contains(searchText) || x.Email.Contains(searchText) || x.Password.Contains(searchText)).ToList();
                ApplySorting(SortOrder, SortBy, userList);
                userList = ApplyPagination(userList, PageNumber);
            }
            else
            {
                ApplySorting(SortOrder, SortBy, userList);
                userList = ApplyPagination(userList, PageNumber);
            }
            return View(userList);
        }




        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(tbl_User objuser)
        {
            WebAppEntities db = new WebAppEntities();
            var user = db.tbl_User.Where(x=>x.UserName == objuser.UserName && x.Password == objuser.Password).Count(); //FirstOrDefault() hole nicea (user !=null) ai condition ta hobe

            if (user > 0)
            {
                return RedirectToAction("UserList");
            }
            else
            {
                return View();
            }
        }

        public ActionResult UserProfile(int id)
        {
            WebAppEntities db = new WebAppEntities();
            var userlist = db.tbl_User.Find(id);

            //ata jokon checkbox null thakbe tokon data get korar jonno
            userlist.IsInterestInCsharp = (userlist.IsInterestInCsharp ==null) ? false : userlist.IsInterestInCsharp;
            userlist.IsInterestInJava = (userlist.IsInterestInJava == null) ? false : userlist.IsInterestInJava;
            userlist.IsInterestInPython = (userlist.IsInterestInPython == null) ? false : userlist.IsInterestInPython;


            //ata dropdown er jonno

            var CityList = db.tbl_City.ToList();
            //ViewBag.CityList = new SelectList(CityList,"CityId", "CityName"); //ata ViewBag er maddome dropdown list patanor jonno
            //return View(userlist);

            

            userlist.CityList = new SelectList(CityList,"CityId", "CityName");  //ata Model er maddome dropdown list patanor jonno

            //for image when it's null
            if (userlist.ImagePath ==null)
            {
                userlist.ImagePath = "~/images/5.png";
            }

            return View(userlist);
        }

        [HttpPost]
        public ActionResult UserProfile(tbl_User objuser, string Csharp, string Java, string Python)
        {

            objuser.IsInterestInCsharp = (Csharp == "true") ? true : false;
            objuser.IsInterestInJava = (Java == "true") ? true : false;
            objuser.IsInterestInPython = (Python == "true") ? true : false;

            //for image
            if (objuser.UserImageFile !=null)
            {
                string fileName = Path.GetFileNameWithoutExtension(objuser.UserImageFile.FileName);
                string extension = Path.GetExtension(objuser.UserImageFile.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssff") + extension;
                objuser.ImagePath = "~/images/" + fileName;
                fileName = Path.Combine(Server.MapPath("~/images/"), fileName);
                objuser.UserImageFile.SaveAs(fileName);
            }


            //image null pass na hoyea no image avaliable image ta show korabe
            if (objuser.ImagePath == "/images/6.jpg")
            {
                objuser.ImagePath = null;
            }


            WebAppEntities db = new WebAppEntities();
            db.Entry(objuser).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("UserList", new {id = objuser.UserId});
        }

        //public ActionResult UserDelete(int id)
        //{
        //    WebAppEntities db = new WebAppEntities();
        //    var category = db.tbl_User.Find(id);
        //    db.tbl_User.Remove(category);
        //    db.SaveChanges();
        //    return RedirectToAction("List");
        //}
    }
}