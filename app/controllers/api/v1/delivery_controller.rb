module Api
    module V1
        class DeliveryController < ApplicationController
            def index
                delivery = Delivery.order('created_at DESC')
                render json: {status: 'SUCCESS', message: 'Deliverys Carregados', data: delivery}, status: :ok
            end

            def show
                delivery = Delivery.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Delivery Carregado', data: delivery}, status: :ok
            end

            def create
                delivery = Delivery.new(delivery_params)
                if delivery.save
                    render json: {status: 'SUCCESS', message: 'Delivery Salvo', data: delivery}, status: :ok 
                else
                    render json: {status: 'ERROR', message: 'Delivery Não Salvo', data: delivery.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                delivery = Delivery.find(params[:id])
                delivery.destroy
                render json: {status: 'SUCCESS', message: 'Delivery Apagado', data: delivery}, status: :ok 
            end

            def update
                delivery = Delivery.find(params[:id])
                if delivery.update(delivery_params)
                    render json: {status: 'SUCCESS', message: 'Delivery Atualizado', data: delivery}, status: :ok 
                else
                    render json: {status: 'ERROR', message: 'Delivery Não atualizado', data: delivery.errors}, status: :unprocessable_entity
                end
            end

            private
            def delivery_params
                params.permit(:produto, :endereco, :saida, :entrada, :entregador)
            end    

        end
    end
end