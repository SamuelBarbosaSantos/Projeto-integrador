using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace AcademiaEnergy.Models
{
    public class Cadastrarcli
    {
        [Key]
        [Required(ErrorMessage = "Seu CPF é necessario.")]
        [RegularExpression(@"^\d{11}$", ErrorMessage = "O CPF deve conter apenas números (11 dígitos).")]
        public string? CPF { get; set; }

        [Required(ErrorMessage = "A senha é obrigatória.")]
        [DataType(DataType.Password)]
        public string? Senha { get; set; }
    }
}

