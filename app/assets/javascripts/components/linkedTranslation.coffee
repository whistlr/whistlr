Whistlr.LinkedTranslationComponent = Em.Component.extend(
  firstResource: null
  secondResource: null
  translation: null
  
  firstLink: ( ->
    resource = @get("firstResource")
    link = "<a href=\"/%@s/%@\">%@</a>".fmt(String(resource.constructor).replace("Whistlr.", "").underscore(), resource.get("id"), resource.get("name"))
    new Handlebars.SafeString(link)
  ).property("firstResource.id", "firstResource.name")
  
  secondLink: ( ->
    resource = @get("secondResource")
    link = "<a href=\"/%@s/%@\">%@</a>".fmt(String(resource.constructor).replace("Whistlr.", "").underscore(), resource.get("id"), resource.get("name"))
    new Handlebars.SafeString(link)
  ).property("secondResource.id", "secondResource.name")
)