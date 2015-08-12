app.controller('OcorrenciasController', ['$scope', '$location', 'Ocorrencias', 'Pacientes', function($scope, $location, ocorrencia, paciente) {
    $scope.statusFilter = undefined;
    $scope.ocorrencias = ocorrencia.get();
    $scope.pacientes = paciente.get();
    $scope.formData = {
        pacientes: {
            idadeEm: 'Anos'
        }
    };
    $scope.success = $location.search().success;

    $scope.changeStatusFilter = function(status)
    {
        $scope.statusFilter = status;
        $scope.ocorrencias = ocorrencia.get(status);
    };

    $scope.addPaciente = function()
    {
        data = {
            nome: $scope.formData.pacientes.nome,
            idade: $scope.formData.pacientes.idade,
            idadeEm: $scope.formData.pacientes.idadeEm
        };

        paciente.new(data);

        clearFormData();
    };

    $scope.removePaciente = function() {
        index = this.$index;

        paciente.delete(index);
    };

    if ($scope.success) {
        $.growl({
            message: 'A ocorrência foi cadastrada com sucesso',
            url: ''
        }, {
            element: 'body',
            type: 'success',
            allow_dismiss: true,
            placement: {
                align: 'center'
            },
            offset: {
                x: 20,
                y: 85
            },
            spacing: 10,
            z_index: 1031,
            delay: 2500,
            timer: 5000,
            url_target: '_blank',
            mouse_over: false,
            icon_type: 'class',
            template: '<div data-growl="container" class="alert" role="alert">' +
            '<button type="button" class="close" data-growl="dismiss">' +
            '<span aria-hidden="true">&times;</span>' +
            '<span class="sr-only">Close</span>' +
            '</button>' +
            '<span data-growl="icon"></span>' +
            '<span data-growl="title"></span>' +
            '<span data-growl="message"></span>' +
            '<a href="#" data-growl="url"></a>' +
            '</div>'
        });
    }

    clearFormData = function()
    {
        $scope.formData = {};
        $scope.formData.pacientes = {
            idadeEm: 'Anos'
        };
    };
}]);