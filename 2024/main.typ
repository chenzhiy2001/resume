#import "chicv.typ": *;

#let Chinese = 0
#let EnglishFull = 1
#let Simplified = 2
#let runReader(mode) = {
  let translate(zh: [], en: []) = {
    if mode == Chinese {
      zh
    } else {
      en
    }
  }
  let noSimple(simple: [], content) = {
    if mode == Simplified {
      simple
    } else {
      content
    }
  }
  let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  let translate-date(month, year) = translate(
    zh: [#year 年 #month 月],
    en: [#months.at(month - 1), #year]
  )
  let current = translate(
    zh: [至今],
    en: [Present]
  )

  let edu = {
    translate(en: [== Education], zh: [== 教育经历])
    let gpa = 3.39/5.0
    let psu-date = [#translate-date(9, 2019) -- #translate-date(6, 2023)]
    translate(
      en: cventry(
        tl: [Bachelor of Engineering in Computer Science and Technology at *Beijing Technology and Business University*, Beijing, China],
        tr: psu-date,
      )[],
      zh: cventry(
        tl: [北京工商大学，计算机科学与技术专业，本科，北京],
        tr: psu-date,
      )[],
    )
  }

  let quancheng = {
    let quancheng-date = [#translate-date(1, 2024) -- #translate-date(2, 2024)]
    let ghLink = githublink("chenzhiy2001/code-debug")
    translate(
      en: cventry(
        tl: [*Quan Cheng Laboratory*, Jinan, Shandong],
        tr: quancheng-date,
        bl: [Flexible Researcher, Secure Operating System Kernel Project],
      )[#noSimple[
        - Adapted the (#ghLink) OS debugging tool for the new operating systems (ArceOS and Starry) being developed by the Secure Operating System Kernel Project
        - Prepared support documents and videos based on colleagues’ feedback after using the OS debugging tool and simplified the installation and configuration process
        - Promoted the use of the OS debugging tool to students (about 20 in total) who are interested in learning OS at two  universities (Beijing  Technology  and  Business  University  and  Henan  University  of  Science  and Technology) via video conference
      ]],
      zh: cventry(
        tl: [*泉城实验室*，济南，山东],
        tr: quancheng-date,
        bl: [流动科研人员，安全操作系统内核项目],
      )[#noSimple[
      - 针对安全操作系统内核项目正在研发的新操作系统（ArceOS和Starry）进行了操作系统调试器 (#ghLink) 的适配
      - 根据同事使用操作系统调试器后的反馈编写帮助文档，制作帮助视频，简化安装配置的流程
      - 通过视频会议向北京工商大学和河南科技大学的有志于学习操作系统的学生（共约20人）推广操作系统调试器的使用
      ]],
    )
  }

  let prizes = {
    let oscomp2023 = {
      let oscomp2023-date = translate-date(8, 2023)
      translate(
        en: cventry(
          tl: [National Grand Prize in the Operating System Race Functional Challenge, 2023 Computer System Development Capability Competition],
          tr: oscomp2023-date
        )[],
        zh: cventry(
          tl: [2023年全国大学生计算机系统能力大赛操作系统赛功能挑战赛全国特等奖],
          tr: oscomp2023-date
        )[]
      )
    }
    let oscomp2022 = {
      let oscomp2022-date = translate-date(8, 2022)
      translate(
        en: cventry(
          tl: [Third Prize, Functional Design Track of Operating System Race, 2022 Computer System Development Capability Competition],
          tr: oscomp2022-date
        )[],
        zh: cventry(
          tl: [2022年全国大学生计算机系统能力大赛操作系统赛功能设计赛道三等奖],
          tr: oscomp2022-date
        )[]
      )
    }
    let oscomp2021 = {
      let oscomp2021-date = translate-date(8, 2021)
      translate(
        en: cventry(
          tl: [Third  Prize,  Kernel  Implementation  Track  of  Operating  System  Race,  2021  Computer System Development Capability Competition],
          tr: oscomp2021-date
        )[],
        zh: cventry(
          tl: [2021年全国大学生计算机系统能力大赛操作系统赛内核实现赛道三等奖],
          tr: oscomp2021-date
        )[]
      )
    }
    let lanqiao2021 = {
      let lanqiao2021-date = translate-date(5, 2021)
      translate(
        en: cventry(
          tl: [Second Prize in Group B, The 12th Lanqiao Cup National Competition for Software and Information Technology Professionals (Beijing Region) - C/C++ Programming],
          tr: lanqiao2021-date
        )[],
        zh: cventry(
          tl: [第十二届蓝桥杯全国软件和信息技术专业人才大赛北京赛区C/C++程序设计大学B组二等奖],
          tr: lanqiao2021-date
        )[]
      )
    }
    let lanqiao2022 = {
      let lanqiao2022-date = translate-date(5, 2022)
      translate(
        en: cventry(
          tl: [First  Prize  in  Group  B,  The  13th  Lanqiao  Cup  National  Competition  for  Software  and Information Technology Professionals (Beijing Region) - C/C++ Programming],
          tr: lanqiao2022-date
        )[],
        zh: cventry(
          tl: [第十三届蓝桥杯全国软件和信息技术专业人才大赛北京赛区C/C++程序设计大学B组一等奖],
          tr: lanqiao2022-date
        )[]
      )
    }
    oscomp2023
    lanqiao2022
    lanqiao2021
    oscomp2022
    oscomp2021
  }

  let oscomp2023research = {
    let oscomp2023research-date = [#translate-date(2, 2023) -- #translate-date(8, 2023)]
    let ghLink = githublink("chenzhiy2001/code-debug")
    translate(
      en: cventry(
        tl: [*Operating  System  Race  Functional  Challenge,  2023  Computer  System Development Capability Competition*, BTBU],
        tr: oscomp2023research-date,
        bl: [Leader, Source-level OS Debugging Tools with Rust Language Support (#ghLink)]
      )[
      - Supported source code trace debugging across kernel state and user state based on QEMU and GDB
      - Supported performance monitoring and analysis across kernel and user states based on eBPF 
      - Supported  the  combination  of  breakpoint  debugging  and  performance  testing  based  on  VSCode  to  build remote development environments
      ],
      zh: cventry(
        tl: [*2023年全国大学生计算机系统能力大赛操作系统赛*，北京工商大学],
        tr: oscomp2023research-date,
        bl: [队长，支持Rust语言的源代码级操作系统调试工具（#ghLink）]
      )[
      - 基于QEMU和GDB，支持跨内核态和用户态的源代码跟踪调试
      - 基于eBPF，支持跨内核态和用户态的性能分析检测
      - 基于VSCode构建远程开发环境，支持断点调试与性能检测的功能结合
      ],
    )
  }

  let qiyuansummer  = {
    let qiyuansummer-date = [#translate-date(8, 2021) -- #translate-date(9, 2021)]
    translate(
      en: cventry(
        tl: [todo],
        tr: qiyuansummer-date,
        bl: [todo]
      )[
      - todo
      ],
      zh: cventry(
        tl: [*2021年开源操作系统夏令营*，北京启元实验室],
        tr: qiyuansummer-date,
        bl: [成员，基于rCore-Tutorial操作系统的性能分析软件实现]
      )[
      - 深入学习并修改rCore-Tutorial操作系统的内核
      - 基于该操作系统，设计并实现了一款类似于Linux中htop的性能分析工具
      ],
    )
  }

  let dachuang  = {
    let dachuang-date = [#translate-date(2, 2021) -- #translate-date(10, 2021)]
    translate(
      en: cventry(
        tl: [Beijing College Students’ Scientific Research and Entrepreneurship Action Plan],
        tr: dachuang-date,
        bl: [Leader,  Research  and  Implementation  of  Internet  of  Things  Operating  System  Kernel  Based  on  K210 Development Board]
      )[
      - todo
      ],
      zh: cventry(
        tl: [*2021年北京市大学生科研与创业行动计划*，北京工商大学],
        tr: dachuang-date,
        bl: [项目负责人，基于K210开发板的物联网操作系统内核研究与实现]
      )[
      - 设计并实现了一个适用于 K210 开发板上操作系统的 FAT32 文件系统
      ],
    )
  }

  let skills = {
    let progLang = {
      let very = "Java Kotlin Rust C# Agda Haskell Arend"
      let somehow = "TypeScript Python Rust Java C C++"
      translate(en: [
        - Programming Languages: comfortable with #somehow.
      ], zh: [
        - 编程语言：熟悉 #somehow。
      ])
    }
    let devTools = {
      let tools = ("YouTrack", "Jira", "GitHub", "BitBucket", /* "Coding.net", "Tower", */ "Slack", "JetBrains Space")
      //#tools.join("、") #tools.join("、")
      translate(en: [
        - Tools: editor-agnostic, have experience with team tools like Github and more.
      ], zh: [- 开发工具：能适应任何常见编辑器/操作系统，有使用 GitHub 等团队协作工具的经验。])
    }
    let ideDev = {
      let pref = "https://plugins.jetbrains.com/plugin/"
      let julia = link(pref + "10413")[Julia]
      let dtlc  = link(pref + "12176")[DTLC]
      let pest  = link(pref + "12046")[Pest]
      translate(en: [
        - IDE Tooling: *2 years of experience*, familiar with VSCode plugin development.
      ], zh: [
        - IDE 工具开发：*2 年开发经验*，熟悉 VSCode 的插件开发。
      ])
    }
    progLang
    ideDev
    devTools
  }

let language = {
  let uk-date = [#translate-date(7, 2014) -- #translate-date(8, 2014)]
  translate(
    en: [- IELTS: 7.5 (L: 8.5 R: 8.5 W: 7.0 S: 6.0)],
    zh: [- 雅思：7.5（听力: 8.5 阅读: 8.5 写作: 7.0 口语: 6.0）]
  )
  translate(
    en: [
    - CET 6: 564
    - CET 4: 585
    - #cventry(
        tl: [Traveling and studying in UK],
        tr: uk-date,
      )[]
    ],
    zh: [
    - CET 6: 564
    - CET 4: 585
    - #cventry(
        tl: [英国游学经历],
        tr: uk-date,
      )[]
    ]
  )
}

let situation = translate(
  en:[todo],
  zh:[
    - 我在新航道B,C班经历过3个月的雅思备考，具有较完整的雅思备考知识体系，在今年3月份取得7.5的成绩 \
      （听力: 8.5 阅读: 8.5 写作: 7.0 口语: 6.0）
    - CET 4: 585/710 (全国排名10%-17%), CET 6: 564/710 (全国排名10%-16%)
    - 我在本科时学过 A-Level Computer Science, A-Level Mathematics (Further), AP Computer Science, AP Calculus AB/BC 所涉及的全部内容，并且经常阅读微积分、计算机科学的英文教材，熟悉用英语教理工科的方法。
    - 我希望当上述AP/A-Level学科或雅思的教师。虽然目前缺乏实战教学经验，但是我相信通过培训，可以在实际教学中取得良好的效果。
  ]
)

let self-intro = translate(
  en:[todo],
  zh:[
    我英语基础扎实，具备用英语教授数学和计算机科学的能力。我曾积极参与各类学术竞赛，获得过优异的成绩，这些经历加深了我对数学和计算机科学的热爱。在教学方面，我具有良好的沟通能力和团队合作精神，乐于与学生分享知识，能够很好地适应不同的教学环境，帮助学生取得学业上的成功。
  ]
)

  // Start of the document

  translate(en: [= #smallcaps[Chen Zhiyang]], zh: [= 陈志扬])

  [#link("mailto:chenzhiy2001@qq.com")[chenzhiy2001\@qq.com] $dot.c$ #iconlink("https://github.com/chenzhiy2001", icon: github)]

  edu

  translate(en: [== Brief Situation], zh: [== 个人情况 & 教授科目])
  situation

  translate(en: [== Self Introduction], zh: [== 自我介绍])
  self-intro

  translate(en: [== Honors and Awards], zh: [== 竞赛经历])
  prizes

  noSimple[
    #translate(en: [== Academic Experience], zh: [== 学术经历])
    #oscomp2023research
    #qiyuansummer
    #dachuang
  ]

  translate(en: [== Internship], zh: [== 实习经历])
  quancheng

  translate(en: [== Skills], zh: [== 编程技能])
  skills
  
  // https://github.com/typst/typst/issues/1462
  {
    set text(size: 0pt)
    [@chen2022online
    @patent2024
    @patent2021]
  }
  translate(en: [== Publications & Patents], zh: [== 论文与专利发表])
  translate(en:bibliography("pub.bib", title: none),zh:bibliography("pub-cn.bib", title: none))
}