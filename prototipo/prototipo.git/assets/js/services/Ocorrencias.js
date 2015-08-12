app.service('Ocorrencias', function(){
    var _ocorrencias = [
        {
            codigo: '123456-1',
            municipio: 'São Paulo',
            queixa: 'Dor de cabeça',
            hora: '09:00',
            status: 'regulacao'
        },
        {
            codigo: '123456-2',
            municipio: 'São Paulo',
            queixa: 'Dor de cabeça',
            hora: '10:00',
            status: 'aberta'
        },
        {
            codigo: '123456-3',
            municipio: 'Osasco',
            queixa: 'Dor de cabeça',
            hora: '11:00',
            status: 'atendimento'
        },
        {
            codigo: '123456-4',
            municipio: 'Guarulhos',
            queixa: 'Dor de cabeça',
            hora: '12:00',
            status: 'aberta'
        },
        {
            codigo: '123456-5',
            municipio: 'São Paulo',
            queixa: 'Dor de cabeça',
            hora: '13:00',
            status: 'aberta'
        },
        {
            codigo: '123456-6',
            municipio: 'Caieiras',
            queixa: 'Dor de cabeça',
            hora: '14:00',
            status: 'atendimento'
        },
        {
            codigo: '123456-7',
            municipio: 'São Paulo',
            queixa: 'Dor de cabeça',
            hora: '15:00',
            status: 'aberta'
        },
        {
            codigo: '123456-8',
            municipio: 'São Paulo',
            queixa: 'Dor de cabeça',
            hora: '16:00',
            status: 'aberta'
        }
    ];

    this.get = function(status)
    {
        if (status == undefined) {
            ocorrencias = _ocorrencias;
        } else {
            ocorrencias = [];

            angular.forEach(_ocorrencias, function(value, index) {
                if (value.status == status) {
                    ocorrencias.push(value);
                }
            });
        }

        return ocorrencias;
    };

    this.new = function(data)
    {
        _ocorrencias.push({
            codigo: data.codigo,
            municipio: data.municipio,
            queixa: data.queixa,
            hora: data.hora,
            status: data.status
        });
    };

    this.delete = function(index) {
        _ocorrencias.splice(index, 1);
    };
});