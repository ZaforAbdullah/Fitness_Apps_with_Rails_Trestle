# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.0.8-3/lib/assets/compiled/rails-ujs.js"
pin "@kurkle/color", to: "https://ga.jspm.io/npm:@kurkle/color@0.3.2/dist/color.esm.js"
pin "chart.js", to: "https://ga.jspm.io/npm:chart.js@4.3.0/dist/chart.js"
#pin "@kurkle/color", to: "https://cdn.jsdelivr.net/npm/color@4.2.3/index.min.js"
