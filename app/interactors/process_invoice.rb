class ProcessInvoice
  include Interactor::Organizer

  organize CreateInvoiceApi, CreateInvoiceDb
end
