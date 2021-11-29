using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApp.Models;

namespace WebApp.Controllers
{
    public class CrudController : Controller
    {
        // GET: Crud
        public ActionResult Create()
        {
            return View();
        }

        //[HttpPost]
        //public ActionResult Create(string name, string description) //string name, string description ai paramitter er maddome view thakea controller a data patano hoicea.
        //{
        //    //ViewBag er maddome view a data patano hoicea
        //    ViewBag.name = name;  
        //    ViewBag.description = description;
        //    return View();
        //}


        [HttpPost]
        public ActionResult Create(tbl_Category category) 
        {
            WebAppEntities db = new WebAppEntities();
            db.tbl_Category.Add(category);
            db.SaveChanges();
            return RedirectToAction("List");
        }

        [HttpGet]
        public ActionResult List()
        {
            WebAppEntities db = new WebAppEntities();
            var list = db.tbl_Category.ToList();
            return View(list);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            WebAppEntities db = new WebAppEntities();
            var category = db.tbl_Category.Find(id);
            return View(category);
        }

        [HttpPost]
        public ActionResult Edit(tbl_Category category)
        {
            WebAppEntities db = new WebAppEntities();
            db.Entry(category).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("List");

        }

        public ActionResult Delete(int CategoryId)
        {
            WebAppEntities db = new WebAppEntities();
            var category = db.tbl_Category.Find(CategoryId);
            db.tbl_Category.Remove(category);
            db.SaveChanges();
            return RedirectToAction("List");
        }
    }
}