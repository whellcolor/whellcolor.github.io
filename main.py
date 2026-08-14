import os

class WhellcolorSASTEngine:
    def __init__(self):
        # 44+ Major Languages & Frameworks mapping
        self.supported_tech = {
            "SAP ABAP": [".abap"],
            "Action Script": [".as"],
            "Angular": [".ts", ".html"],
            "Apex": [".cls", ".trigger"],
            "Microsoft ASP": [".asp"],
            "Bash": [".sh"],
            "Bicep": [".bicep"],
            "CSharp": [".cs"],
            "C++": [".cpp", ".cc", ".h"],
            "COBOL": [".cbl", ".cob"],
            "Cold Fusion": [".cfm"],
            "Delphi": [".pas", ".dfm"],
            "Docker": ["Dockerfile"],
            "Elixir": [".ex", ".exs"],
            "Erlang": [".erl", ".hrl"],
            "Go Lang": [".go"],
            "Groovy": [".groovy"],
            "HTML5": [".html", ".htm"],
            "Java": [".java"],
            "Java Script": [".js"],
            "JSON": [".json"],
            "JSP": [".jsp"],
            "Kotlin": [".kt", ".kts"],
            "Lua": [".lua"],
            "MXML": [".mxml"],
            ".Net": [".cs", ".vb"],
            ".NETCore": [".cs", ".json"],
            "Perl": [".pl", ".pm"],
            "PL/SQL": [".sql"],
            "PowerShell": [".ps1"],
            "Python": [".py"],
            "R": [".r"],
            "Ruby": [".rb"],
            "Rust": [".rs"],
            "Scala": [".scala"],
            "Swift Trans": [".swift"],
            "T-SQL": [".sql"],
            "Terraform": [".tf"],
            "Type Script": [".ts"],
            "Microsoft Visual Basics": [".vb"],
            "Visual Basic": [".vbs", ".vb"],
            "Windows Mobile": [".cs"],
            "XML": [".xml"],
            "YAML": [".yaml", ".yml"]
        }

    def analyze(self, filename, content=""):
        ext = os.path.splitext(filename)[1].lower()
        detected_lang = "Unknown"

        for lang, exts in self.supported_tech.items():
            if ext in exts or filename in exts:
                detected_lang = lang
                break

        # Simulasi deteksi kerentanan berbasis SSR (Software Security Research)
        risk_level = "Low"
        issues_count = 0
        if "eval(" in content or "SELECT *" in content or "system(" in content:
            risk_level = "High"
            issues_count = 1

        return {
            "filename": filename,
            "detected_language": detected_lang,
            "risk_level": risk_level,
            "vulnerabilities_found": issues_count,
            "message": f"Successfully analyzed {filename} using rules for {detected_lang}"
        }

if __name__ == "__main__":
    engine = WhellcolorSASTEngine()
    print(f"Loaded {len(engine.supported_tech)} languages/frameworks successfully.")
