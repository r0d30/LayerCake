# LayerCake Programming Language

**A modern, efficient programming language that compiles to optimized native code via Linux assembly.**

[![License: MIT](https://img.shields.io/badge/License-MIT%20Enhanced-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.1-green.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-Linux%20x64-green.svg)](#)
[![Non-Commercial](https://img.shields.io/badge/Commercial%20Sale-PROHIBITED-red.svg)](LICENSING.md)

## 🎯 Vision

LayerCake is designed to **replace C/C++** while fixing their fundamental issues:
- **Memory safety** without garbage collection overhead
- **Modern syntax** that's actually readable  
- **Zero-cost abstractions** with predictable performance
- **Cross-platform compilation** from a single codebase
- **Developer-friendly** error messages and tooling

## 🏗️ Architecture

LayerCake uses a **two-phase compilation** approach:

```
Source Code (.lc) → LC_core → Intermediate → LC_asm → Native Binary
```

- **LC_core**: Translates LayerCake syntax to intermediate representation
- **LC_asm**: Cross-platform assembler and linker (target-specific output)

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/r0d30/LayerCake.git
cd LayerCake

# Build the compiler (when implemented)
make build

# Usage will be determined during development
```

## 💻 Example Code

*LayerCake syntax is still in development. Examples will be added as the language design progresses.*

## 📚 Documentation

- **[Assembly Guide](ASSEMBLY_LINUX_GUIDE.txt)** - Complete Linux assembly reference
- **[Project Roadmap](src/tasks.txt)** - Development timeline and milestones
- **[Architecture Overview](src/LC_core/)** - Core compiler components
- **[Commercial Rights](COMMERCIAL.md)** - Business model and licensing

## 🧪 Testing

*Testing framework will be implemented alongside the compiler.*

```bash
# Future testing commands (not yet implemented)
make test
make test MODULE=lexer
make test_integration
```

## 🛠️ Development

### Prerequisites
- Linux x64 system (WSL2 supported)
- NASM assembler
- GDB debugger
- Make build system

### Building from Source
```bash
# Development build
make build_debug

# Release build  
make build_release

# Clean build artifacts
make clean
```

### Project Structure
```
LayerCake/
├── src/
│   ├── LC_core/          # Core compiler (lexer, parser, codegen)
│   ├── LC_asm/           # Assembler and linker (future)
│   └── main.asm          # Entry point
├── cli/                  # Command-line interface
├── tests/                # Test suites
├── docs/                 # Documentation
├── scripts/              # Build scripts
└── examples/             # Example programs
```

## 🤝 Contributing

We welcome contributions! Please see:
- **[Contributors Guide](CONTRIBUTORS.md)** - How to contribute
- **[Copyright Info](COPYRIGHT.md)** - Legal information
- **Code Style**: Follow existing assembly conventions
- **Testing**: All changes must include tests

### Contribution Process
1. Fork the repository
2. Create a feature branch
3. Add tests for your changes
4. Ensure all tests pass
5. Submit a pull request

## 📜 Legal & Licensing

### Open Source License
LayerCake is licensed under **MIT License with Enhanced Attribution and Commercial Restrictions**:
- ✅ **Free to use** for personal, educational, and research purposes
- ✅ **Free to modify** and redistribute as LayerCake
- ✅ **Commercial application development** permitted with LayerCake
- ❌ **Commercial sale** of LayerCake itself or its libraries prohibited
- ❌ **Renaming** or rebranding LayerCake prohibited

### Attribution Requirements
- Software compiled with LayerCake must credit LayerCake
- Derivative works must acknowledge LayerCake origin
- Redistributions must maintain the LayerCake name
- Commercial products built with LayerCake should include attribution

### Commercial Rights
The original creator retains exclusive rights to:
- Commercial licensing of LayerCake itself
- Official support and consulting services  
- Premium tools and extensions development
- LayerCake trademark and branding usage

**See [LICENSE](LICENSE) for complete legal terms and [LICENSING.md](LICENSING.md) for quick reference.**

## 💰 Commercial Services

For businesses requiring:
- **Premium Support** with SLA guarantees
- **Custom Development** and consulting
- **Commercial Licensing** without attribution
- **Training and Certification** programs

Contact: **noel.rodrigue.7850@gmail.com**

## 📞 Contact & Community

- **GitHub Issues**: Bug reports and feature requests
- **Discussions**: Community Q&A and ideas
- **Email**: noel.rodrigue.7850@gmail.com
- **Business**: noel.rodrigue.7850@gmail.com

## 🎯 Roadmap

### Current Status: **v1.0.0 - Foundation Release** 🎉
- [x] Project architecture defined
- [x] Legal framework established  
- [x] Development environment ready
- [x] Complete documentation suite
- [x] GPG signing configured
- [x] MIT License with Enhanced Attribution
- [ ] Lexer implementation
- [ ] Parser implementation
- [ ] Code generation
- [ ] First compiled program

### Upcoming Milestones
- **v1.1**: Basic lexer functionality
- **v1.2**: Parser implementation
- **v1.3**: Code generation  
- **v2.0**: First working compiler

See **[src/tasks.txt](src/tasks.txt)** for detailed roadmap.

## 🏆 Acknowledgments

- **Original Creator**: Rodrigue Noel (r0d30) - Project founder and architect
- **Community**: All contributors and supporters
- **Inspiration**: C, Rust, Python, and the assembly language community

---

## 📄 Copyright Notice

```
Copyright (c) 2024-2025 LayerCake Project
Original Creator: Rodrigue Noel (r0d30)

This project is open source but the creator retains commercial rights.
See LICENSE, COPYRIGHT.md, and COMMERCIAL.md for details.
```

**LayerCake** - *Modern programming, native performance* 🍰
