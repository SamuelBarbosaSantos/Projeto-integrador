using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace AcademiaEnergy.Models
{
    public class Cadastrarcli
    {
        [Display(Name = "CPF")]
        public decimal? CPF { get; set; }

        [Display(Name = "Senha")]
        public decimal? Senha { get; set; }

        [Display(Name = "Telefone")]
        public decimal? Tell { get; set; }

        [Display(Name = "DataNasc")]
        [DataType(DataType.Date)]
        public DateTime DataNasc { get; set; }

        [Display(Name = "Massa Corporal")]
        public decimal? MassaCorporal { get; set; }

        [Display(Name = "Altura")]
        public char? Altura { get; set; }

        [Display(Name = "IMC")]
        public decimal? IMC { get; set; }

    }
}

