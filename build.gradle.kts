buildscript {
    apply(from = "${project.rootDir}/gradleConfig/project-config.gradle")
}

plugins {
    id("com.android.application") version "8.1.0" apply false
    id("org.jetbrains.kotlin.android") version "1.8.10" apply false
    id("io.gitlab.arturbosch.detekt").version("1.23.1")
    id("org.sonarqube") version "4.3.0.3225"
    id("de.undercouch.download") version "5.5.0"
}

tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}

apply(from = "${project.rootDir}/gradleConfig/update/project-update.gradle")