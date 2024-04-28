using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Assignment1.Models;

namespace Assignment1.Controllers
{

    [RoutePrefix("api/country")]
    public class CountryController : ApiController
    {
        private List<Country> countries = new List<Country>()
        {
            new Country { ID = 1, CountryName = "India", Capital = "New Delhi" },
            new Country { ID = 2, CountryName = "France", Capital = "Paris" }
        };

        [HttpGet]
        //[Route("getall")]
        public IEnumerable<Country> GetCountries()
        {
            return countries;
        }

        [HttpGet]
        [Route("getbyid")]
        public IHttpActionResult GetCountryById(int id)
        {
            var country = countries.FirstOrDefault(c => c.ID == id);
            if (country == null)
            {
                return NotFound();
            }
            return Ok(country);
        }

        [HttpPost]
        public List<Country> countryPost([FromBody] Country c)
        {
            countries.Add(c);
            return countries;
        }

        [HttpPut]
        [Route("putdata")]
        public IHttpActionResult UpdateCountry(int id, [FromBody] Country country)
        {
            if (country == null)
            {
                return BadRequest("Invalid country data");
            }

            var existingCountry = countries.FirstOrDefault(c => c.ID == id);
            if (existingCountry == null)
            {
                return NotFound();
            }

            // Update existing country properties
            existingCountry.CountryName = country.CountryName;
            existingCountry.Capital = country.Capital;

            return Ok(existingCountry);
        }

        [HttpDelete]
        [Route("deldata")]
        public IHttpActionResult DeleteCountry(int id)
        {
            var country = countries.FirstOrDefault(c => c.ID == id);
            if (country == null)
            {
                return NotFound();
            }

            countries.Remove(country);
            return StatusCode(HttpStatusCode.NoContent);
        }
    }
}
