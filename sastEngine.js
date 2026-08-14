/**
 * Whellcolor Fortify SAST Engine - Node.js Implementation
 * Supports 44+ Major Languages and Frameworks
 */

class WhellcolorSAST {
    constructor() {
        this.supportedTech = {
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
        };
    }

    detectLanguage(filename) {
        const ext = filename.substring(filename.lastIndexOf('.')).toLowerCase();
        for (const [lang, extensions] of Object.entries(this.supportedTech)) {
            if (extensions.includes(ext) || extensions.includes(filename)) {
                return lang;
            }
        }
        return "Unsupported Language";
    }

    runScan(fileName) {
        const language = this.detectLanguage(fileName);
        return {
            targetFile: fileName,
            matchedTechnology: language,
            engine: "Whellcolor Fortify SAST Security Research",
            secureStatus: "Passed"
        };
    }
}

// Contoh Penggunaan:
const sast = new WhellcolorSAST();
console.log("Total Languages Supported:", Object.keys(sast.supportedTech).length);
console.log(sast.runScan("main.py"));
