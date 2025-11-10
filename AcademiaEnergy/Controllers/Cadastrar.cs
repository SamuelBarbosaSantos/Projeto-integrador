using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;

namespace AcademiaEnergy.Controllers
{
    public class Cadastrar : Controller
    {
        private readonly IConfiguration _configuration;
        public Cadastrar(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        [HttpGet]
        public IActionResult Cadastrarcli()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Cadastrarcli(Cadastrar produto)
        {
            string? connectionString = _configuration.GetConnectionString("DefaultConnection");
            using var connection = new MySqlConnection(connectionString);
            connection.Open();

            string sql = "INSERT INTO  (Prodnome,Proddescr) VALUES (@Prodnome, @Proddescr)";
            MySqlCommand command = new MySqlCommand(sql, connection);
            command.Parameters.AddWithValue("@Prodnome", produto.Prodnome);
            command.Parameters.AddWithValue("@Proddescr", produto.Proddescr);
            command.ExecuteNonQuery();

            return RedirectToAction("Index", "Home");
        }

    }
}