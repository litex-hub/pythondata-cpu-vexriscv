val spinalVersion = "1.13.0"

lazy val root = (project in file(".")).
  settings(
    inThisBuild(List(
      organization := "com.github.spinalhdl",
      scalaVersion := "2.12.18",
      version      := "2.0.0"
    )),
    name := "VexRiscvOnWishbone",
    libraryDependencies ++= Seq(
        compilerPlugin("com.github.spinalhdl" %% "spinalhdl-idsl-plugin" % spinalVersion)
    ),
    scalacOptions += s"-Xplugin-require:idsl-plugin"
  ).dependsOn(vexRiscv)


lazy val vexRiscv = RootProject(file("ext/VexRiscv"))
fork := true
