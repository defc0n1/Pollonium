# global language settings for templates

@languageText = {}

# Helper to append properties dynamically
languageText.appendProperties = (langObjs) ->
  for obj in langObjs
    this[obj.label] = 
        en: obj.en
        sw: obj.sw
  return