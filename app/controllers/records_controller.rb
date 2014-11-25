class RecordsController < ApplicationController
  def index
    @target_date = (params[:target_date] || Date.today).to_date
    @records = Record.where(recorded_on: @target_date.beginning_of_month..@target_date.end_of_month).order("recorded_on ASC")
  end

  def new
    if params[:recorded_on]
      @record = Record.where(recorded_on: params[:recorded_on]).first_or_initialize
    else
      @record = Record.new
    end
  end

  def create
    @record = Record.new(record_params)
    @record.recorded_on = Date.today
    @record.ended_at = nil
    if @record.save
      flash[:success] = 'Created'
      redirect_to records_path
    else
      flash[:warning] = 'Failed'
      render action: :new
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      flash[:success] = 'Updated'
      redirect_to records_path
    else
      render action: :edit
    end
  end

  def destroy
    @record = Record.find(params[:id])
    if @record.destroy
      flash[:success] = 'Removed'
      redirect_to records_path
    else
      redirect_to records_path
    end
  end

  private

  def record_params
    params.require(:record).permit(:recorded_on, :started_at, :ended_at, :break_time, :absence)
  end
end
