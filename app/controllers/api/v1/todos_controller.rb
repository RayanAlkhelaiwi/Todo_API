# frozen_string_literal: true

module Api
  module V1
    # Todos Controller
    class TodosController < ApplicationController
      def index
        todos = Todo.order('created_at DESC')
        render json: { status: 200, success: true, message: 'fetched successfully', data: todos }, status: :ok
      end

      def show
        todo = Todo.find(params[:id])
        render json: { status: 200, success: true, message: 'fetched successfully', data: todo }, status: :ok
      end

      def create
        todo = Todo.new(todos_params)

        if todo.save
          render json: { status: 200, success: true, message: 'created successfully', data: todo }, status: :ok
        else
          render json: { status: 422, success: false, message: 'unprocessable entity', data: todo.errors },
                 status: :unprocessable_entity
        end
      end

      def update
        todo = Todo.find(params[:id])

        if todo.update_attributes(todos_params)
          render json: { status: 200, success: true, message: 'updated successfully', data: todo }, status: :ok
        else
          render json: { status: 422, success: false, message: 'unprocessable entity', data: todo.errors },
                 status: :unprocessable_entity
        end
      end

      def destroy
        todo = Todo.find(params[:id])
        todo.destroy
        render json: { status: 200, data: 'deleted successfully', id: todo.id }, status: :ok
      end

      private

      def todos_params
        params.permit(:title, :body)
      end
    end
  end
end
