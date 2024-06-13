class TabFilesController < ApplicationController
  def new
    @tab_files = TabFile.all
    @total_revenue = calculate_total_revenue(@tab_files)
  end

  def create
    uploaded_file = params[:file]
    if uploaded_file.present?
      process_uploaded_file(uploaded_file)
      redirect_to root_path, notice: 'Upload de arquivo TAB Concluido com sucesso.'
    else
      flash[:alert] = 'Please choose a file to upload.'
      render :new
    end
  end

  def destroy
    tab_file = TabFile.find(params[:id])
    tab_file.destroy
    redirect_to root_path, notice: 'TAB file was successfully deleted.'
  end

  private

  def calculate_total_revenue(tab_files)
    total_revenue = tab_files.sum { |tab_file| tab_file.item_price.to_f * tab_file.purchase_count.to_i }
    total_revenue
  end

  def process_uploaded_file(uploaded_file)
    File.open(uploaded_file.tempfile, 'r:ISO-8859-1').each_line.with_index do |line, index|
      next if index.zero?

      columns = line.chomp.split("\t")

      tab_file = TabFile.new(
        purchaser_name: columns[0],
        item_description: columns[1],
        item_price: columns[2].to_f,
        purchase_count: columns[3].to_i,
        merchant_address: columns[4],
        merchant_name: columns[5]
      )

      if tab_file.save
        Rails.logger.info "TabFile saved successfully: #{tab_file.inspect}"
      else
        Rails.logger.error "Error creating TabFile: #{tab_file.errors.full_messages.join(', ')}"
      end
    end
  end
end
