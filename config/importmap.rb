# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.1/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "datatables.net", to: "https://cdn.datatables.net/1.13.1/js/jquery.dataTables.mjs"
pin 'jquery', to: "https://ga.jspm.io/npm:jquery@3.6.1/dist/jquery.js"
pin "stimulus-dropdown", to: "https://ga.jspm.io/npm:stimulus-dropdown@2.1.0/dist/stimulus-dropdown.mjs"
pin "hotkeys-js", to: "https://ga.jspm.io/npm:hotkeys-js@3.10.1/dist/hotkeys.esm.js"
pin "stimulus-use", to: "https://ga.jspm.io/npm:stimulus-use@0.51.3/dist/index.js"
pin "bootstrap", to: 'boostrap.min.js', preload: true
pin "popper", to: 'popper.js', preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "datatables", to: "https://ga.jspm.io/npm:datatables@1.10.18/media/js/jquery.dataTables.js"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.4/dist/jquery.js"
