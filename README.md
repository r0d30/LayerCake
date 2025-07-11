# LayerCake

**A multi-language low-level ecosystem for modern cross-platform programming**

[![License: MIT](https://img.shields.io/badge/License-MIT%20Enhanced-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Linux%20x64-green.svg)](#)
<<<<<<< HEAD
<<<<<<< Updated upstream
[![Status](https://img.shields.io/badge/Status-In%20Development-orange.svg)](#)
=======
<<<<<<< HEAD
=======
[![Non-Commercial](https://img.shields.io/badge/Commercial%20Sale-PROHIBITED-red.svg)](LICENSING.md)
>>>>>>> f12161a (feat: LayerCake v1.0.1 - Complete license enforcement)
>>>>>>> Stashed changes
=======
[![Status](https://img.shields.io/badge/Status-In%20Development-orange.svg)](#)
>>>>>>> 2f0128e49b2c8c2f721ea60c92cd6db9e3d670f9

---

## 🎯 Project Vision (Ideas and Future Goals)

*Note: Most elements described below are just seeds of ideas for now*

### General Philosophy
LayerCake is not a single language but an **ecosystem of three languages** designed to coexist and complement each other, while remaining as low-level as possible. The goal is to create an equivalent to C/C++ in terms of manufacturing limitations (Linux assembly almost exclusively, with the possibility of using ZIG if necessary, but categorical refusal to use C/C++).

### The Three Languages of the Ecosystem

#### 1. **LC_core** - The philosophical equivalent of C
- Low-level compiled language
- Designed for performance and precise control
- Compiles to LC_asm

#### 2. **LC_asm** - Cross-platform assembly overlay
- More pleasant but familiar syntax compared to raw assembly
- Filled with integrated small optimizations
- Allows easy debugging of the result after compilation from LC_core
- Low-level compiler capable of generating assembly for any platform:
  - Windows, Mac, Linux, Android, iOS
  - Transformation into different executable types according to target platform

#### 3. **LC** - The philosophical equivalent of Python
- High-level interpreted language
- Simplified and modular syntax
- Designed to be accessible to young developers while remaining powerful for pros

### Unification and Consistency
- **Common extension**: All languages use the `.lc` extension
- **Definition attribute**: Each .lc file starts with a mandatory attribute defining the syntax used (LC_core, LC_asm, or LC)
- **Interoperability**: The three languages are designed to coexist (interpreted files working with compiled executables)
- **Universal syntax**: Similar syntax elements between the three languages

### Cross-Platform Compilation Workflow
```
.lc files (LC_core) → .lc files (LC_asm) → .s files (AT&T/Intel) → Executable (.app/.exe/.elf)
```

### Long-Term Goals

#### Cross-Platform Bootstrap
Once LayerCake is operational, the goal is to bootstrap it for each platform, thus creating a language/compiler:
- Multi-layer and cross-platform
- Maximally automatable or manually configurable
- Capable of compiling, launching and debugging cross-platform projects

#### Envisioned Frameworks and Libraries
- **Cross-platform 2D GUI framework**: Responsive graphical interfaces inspired by the web
- **Advanced 3D engine**: Video games, 3D printing, animation
- **Low-level graphics management**: Pixel manipulation, complex mathematical curves (quadratic, Bézier)
- **Data visualization**: Graphical representations of complex data
- **Scientific libraries**: Mathematical calculations, scientific and medical research
- **Web tools**: Frameworks for web development
- **AI and ML**: Tools for creating and modifying artificial intelligence models
- **Memory management**: Modular garbage collectors and advanced memory management tools

---

## 🚧 Current Development Status

### What is Functional
- [x] **Project architecture** defined and documented
- [x] **Development environment** Linux/WSL configured
- [x] **Assembly macro system** complete with official architectural names
- [x] **Ultra-detailed Linux assembly guide** (2400+ lines)
- [x] **Basic file structure** established
- [x] **Makefile** optimized for Linux/WSL
- [x] **Complete documentation** for low-level development

### In Preparation
- [ ] **Syntax definition** for the three languages
- [ ] **Lexer implementation** for LC_core
- [ ] **Parser development** for LC_core
- [ ] **Code generator** LC_core → LC_asm
- [ ] **LC_asm compiler** to native assembly
- [ ] **Basic LC interpreter**

### Next Steps
1. **Syntactic design**: Definition of the three language syntaxes
2. **Prototyping**: First tests with simple programs
3. **Lexer/parser implementation**: Basic syntactic analysis
4. **Code generation**: First functional compilation
5. **Cross-platform testing**: Validation on different systems

---

## 🛠️ Installation and Usage

### Prerequisites
- **System**: Linux x64 (WSL2 supported)
- **Tools**: NASM, GCC, Make, GDB

### Available Make Commands

#### Development
```bash
# Clean build files
make clean

# Compile a test assembly program
make build_elf PROG_NAME=main

# Compile and execute
make run PROG_NAME=main

# Development mode (compile + execute)
make dev PROG_NAME=main

# Test the build
make test PROG_NAME=main
```

#### Development Tools
```bash
# Generate link order
make link_order

# Check system limits
make check_limits

# Help on available commands
make help
```

### Project Structure
```
LayerCake/
├── src/
│   ├── LC_core/          # Future LC_core compiler
│   │   ├── lexer/        # Lexical analysis
│   │   ├── parser/       # Syntactic analysis
│   │   └── codegen/      # Code generation
│   ├── main.asm          # Current entry point (test)
│   └── lc_syscalls.asm   # Official assembly macros
├── build/                # Compiled files
├── scripts/              # Utility scripts
├── ASSEMBLY_LINUX_GUIDE.txt  # Complete assembly guide
└── Makefile              # Build system
```

<<<<<<< HEAD
<<<<<<< Updated upstream
=======
>>>>>>> 2f0128e49b2c8c2f721ea60c92cd6db9e3d670f9
### File Status
- **src/main.asm**: "Hello World" test program with official macros
- **src/LC_core/lc_syscalls.asm**: 1000+ lines of assembly macros
- **ASSEMBLY_LINUX_GUIDE.txt**: Complete guide (2400+ lines)
- **Makefile**: Linux/WSL optimized build system
<<<<<<< HEAD
=======
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
<<<<<<< HEAD
LayerCake is licensed under **MIT License with Enhanced Attribution**:
- ✅ **Free to use** for any purpose
- ✅ **Free to modify** and distribute as LayerCake
- ❌ **Commercial sale** of LayerCake or its libraries requires permission
- ✅ **No payment required** for use and modification

### Attribution Requirements
- Software compiled with LayerCake must credit LayerCake
- Derivative works must acknowledge LayerCake
- Commercial products should include LayerCake attribution

### Commercial Rights
The original creator retains exclusive rights to:
- Commercial licensing alternatives
- Official support and consulting  
- Premium tools and extensions
- LayerCake trademark usage

**See [LICENSE](LICENSE) for complete terms.**
=======
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
>>>>>>> f12161a (feat: LayerCake v1.0.1 - Complete license enforcement)

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
>>>>>>> Stashed changes
=======
>>>>>>> 2f0128e49b2c8c2f721ea60c92cd6db9e3d670f9

---

## 📜 Licensing and Legal Framework

### Project Licensing Structure
LayerCake uses a **multi-tiered licensing approach** designed to protect the project's integrity while enabling widespread use:

#### Core License: MIT with Enhanced Attribution
- **Base**: MIT License for maximum compatibility
- **Enhanced Attribution**: Mandatory credit requirements
- **Commercial Restrictions**: Specific limitations on commercial redistribution

#### What You CAN Do
- ✅ **Use LayerCake freely** for personal, educational, and research projects
- ✅ **Modify and distribute** LayerCake under the same license terms
- ✅ **Build commercial applications** with LayerCake (applications built WITH LayerCake)
- ✅ **Contribute** to the open-source project development
- ✅ **Fork** the project while maintaining attribution and name

#### What You CANNOT Do
- ❌ **Sell LayerCake itself** or its core libraries commercially
- ❌ **Rename or rebrand** LayerCake to avoid attribution
- ❌ **Remove attribution** requirements from compiled software
- ❌ **Create proprietary forks** without maintaining open-source licensing

#### Attribution Requirements
All software compiled with LayerCake must include:
- **LayerCake credit** in documentation or about sections
- **License acknowledgment** in redistributed binaries
- **Original creator attribution**: Rodrigue Noel (r0d30)
- **Project name preservation**: Must remain "LayerCake"

### Commercial Rights Reserved
The original creator retains exclusive rights to:
- **Official commercial licensing** without attribution requirements
- **Premium support services** and consulting
- **Trademark and branding** usage rights
- **Certified training programs** and professional services

### Legal Documents
- **[LICENSE](LICENSE)**: Complete legal terms and conditions
- **[LICENSING.md](LICENSING.md)**: Quick reference guide
- **[COMMERCIAL.md](COMMERCIAL.md)**: Business model and commercial restrictions
- **[COPYRIGHT.md](COPYRIGHT.md)**: Copyright information and attribution requirements

### Contact for Commercial Licensing
For businesses requiring commercial licensing without attribution:
- **Email**: noel.rodrigue.7850@gmail.com
- **Subject**: "LayerCake Commercial Licensing Inquiry"

---

*LayerCake is currently in active development. The syntax is not yet defined and no code examples are available for now.*