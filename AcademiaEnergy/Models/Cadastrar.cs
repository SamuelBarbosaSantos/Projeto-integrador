using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace AcademiaEnergy.Models
{
    public class Cadastrarcli
    {
        [Display(Name = "CPF")]
        public decimal? CPF { get; set; }

        [Display(Name = "NomeCliente")]
        public string? NomeCliente { get; set; }

        [Display(Name = "TelCelular")]
        public decimal? TelCelular { get; set; }

        [Display(Name = "DataNasc")]
        [DataType(DataType.Date)]
        public DateTime DataNasc { get; set; }

        [Display(Name = "NumEndereco")]
        public string? NumEndereco { get; set; }

        [Display(Name = "Logradouro")]
        public string? Logradouro { get; set; }

    }
}

