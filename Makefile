containername:
    for i in 1 2 3 4 5; do \
        if [ $$i -lt 4 ]; then \
            echo "$$i is less than 4"; \
        else \
            echo "$$i is greater than or equal to 4"; \
        fi \
    done


	
