-- Funcție pentru procesarea blocurilor de cod
function CodeBlock(el)
    -- Verifică dacă blocul de cod este de tip plantuml
    if el.classes[1] == "plantuml" then
        -- Stochează codul diagramei într-o variabilă
        local diagram_code = el.text

        -- Comanda pentru a apela PlantUML pentru PNG
        local plantuml_cmd = "java"
        local plantuml_args = { "-jar", "plantuml.jar", "-tpng", "-pipe" }

        -- Procesează codul folosind pandoc.pipe
        local success, png_diagram = pcall(function()
            return pandoc.pipe(plantuml_cmd, plantuml_args, diagram_code)
        end)

        if not success then
            io.stderr:write("Eroare la procesarea diagramei: " .. png_diagram .. "\n")
            return el  -- Returnează blocul neschimbat în caz de eroare
        end

        -- Creează un nume unic pentru fișierul PNG
        local filename = "diagram_" .. os.time() .. ".png"

        -- Adaugă PNG-ul în mediabag
        pandoc.mediabag.insert(filename, "image/png", png_diagram)

        -- Returnează un element imagine Pandoc cu referință la fișierul PNG din mediabag
        return pandoc.Para({pandoc.Image({pandoc.Str("Diagrama generată")}, filename)})
    end
end