<h1>Dupla</h1>
<h3>Samuel Barbosa Santos</h3>
<h3>Natã Barsotti Plaça</h3>

<h1>Explicação</h1>
<h4>Cadastrar.cs</h4>
<p>
Cadastrar é um controller que recebe IConfiguration por injeção para ler a connection string.
Cadastrarcli() retorna a View do formulário.
Cadastrarcli(Cadastrarcli cadastrar) abre uma conexão Mysql, monta um insert com parâmetros, popula os parâmetros a partir do model Cadastrarcli, executa ExecuteNonQuery() e redireciona para a action get.
</p>

<h4>Cadastrarcli.cshtml</h4>
<p>
ViewData["Title"] define o título da página.
O formulário usa tag‑helpers isso envia o post para a action Cadastrarcli do CadastrarController (o arquivo Controllers/Cadastrar.cs).
Cada campo usa asp-for gera id/name compatíveis com o model.
asp-validation-for + asp-validation-summary mostram erros do ModelState. _ValidationScriptsPartial adiciona as validações client‑side (jQuery Validation) — certifique‑se que _Layout renderiza a seção Scripts.
</p>

<h5>Cadastrar.cs</h5>
<p>
A classe Cadastrarcli representa os dados do cliente usados pelo formulário.
Propriedades atuais: CPF, NomeCliente, TelCelular, DataNasc, NumEndereco, Logradouro.
</p>
