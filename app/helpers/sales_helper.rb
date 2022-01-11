module SalesHelper

    def active_sale?
        Sale.active.any?

        @sale = Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?", 
            Date.current, Date.current).first
    end
end