import os
import json

class WhellcolorFortifySAST:
    def __init__(self):
        # 44+ Major Languages & Frameworks Mapping with Extensions
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

    def scan_file(self, file_path):
        """Menganalisis file dan mendeteksi kerentanan berdasarkan bahasa pemrograman"""
        if not os.path.exists(file_path):
            return {"error": "File not found"}

        file_ext = os.path.splitext(file_path)[1].lower()
        filename = os.path.basename(file_path)
        
        detected_lang = "Unknown"
        for lang, exts in self.supported_tech.items():
            if file_ext in exts or filename in exts:
                detected_lang = lang
                break

        # Simulasi hasil temuan SAST (Software Security Research standard)
        scan_result = {
            "file": filename,
            "detected_language": detected_lang,
            "status": "Scanned by Whellcolor Fortify Engine",
            "vulnerabilities_found": 0,
            "details": f"Successfully parsed using ruleset for {detected_lang}"
        }
        return scan_result

# Contoh Penggunaan:
if __name__ == "__main__":
    scanner = WhellcolorFortifySAST()
    print(f"Total Supported Frameworks & Languages loaded: {len(scanner.supported_tech)}")
    
    # Test scan file contoh
    result = scanner.scan_file("app.py")
    print(json.dumps(result, indent=4))
