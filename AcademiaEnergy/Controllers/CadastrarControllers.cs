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
        public IActionResult Cadastrarcli(Cadastrar cadastrar)
        {
            string? connectionString = _configuration.GetConnectionString("DefaultConnection");
            using var connection = new MySqlConnection(connectionString);
            connection.Open();

            string sql = "INSERT INTO tbCliente (CPF, NomeCliente, TelCelular, DataNasc, NumEndereco, Logradouro) VALUES (@CPF, @NomeCliente, @TelCelular, @DataNasc, @NumEndereco, @Logradouro)";
            MySqlCommand command = new MySqlCommand(sql, connection);
            command.Parameters.AddWithValue("@CPF", cadastrar.CPF);
            command.Parameters.AddWithValue("@NomeCliente", cadastrar.NomeCliente);
            command.Parameters.AddWithValue("@TelCelular", cadastrar.TelCelular);
            command.Parameters.AddWithValue("@DataNasc", cadastrar.DataNasc);
            command.Parameters.AddWithValue("@NumEndereco", cadastrar.NumEndereco);
            command.Parameters.AddWithValue("@Logradouro", cadastrar.Logradouro);
            command.ExecuteNonQuery();

            return RedirectToAction("Index", "Home");
        }

    }
}