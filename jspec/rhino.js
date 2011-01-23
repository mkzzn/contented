
load('/home/rukkus/.rvm/gems/ruby-1.8.7-p302@default/gems/jspec-4.3.3/lib/jspec.js')
load('/home/rukkus/.rvm/gems/ruby-1.8.7-p302@default/gems/jspec-4.3.3/lib/jspec.xhr.js')
load('public/javascripts/application.js')
load('jspec/unit/spec.helper.js')

JSpec
.exec('jspec/unit/spec.js')
.run({ reporter: JSpec.reporters.Terminal, fixturePath: 'jspec/fixtures' })
.report()