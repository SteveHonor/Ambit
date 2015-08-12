app.service('Pacientes', function(){
    var _pacientes = [];

    this.get = function()
    {
        return _pacientes;
    };

    this.new = function(data)
    {
        _pacientes.push({
            nome: data.nome,
            idade: data.idade,
            idadeEm: data.idadeEm
        });
    };

    this.delete = function(index) {
        _pacientes.splice(index, 1);
    };
});