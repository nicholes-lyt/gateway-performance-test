import com.github.jengelman.gradle.plugins.shadow.tasks.ShadowJar

plugins {
    java
    application
    id("com.github.johnrengelman.shadow") version "4.0.3"
}

repositories {
    jcenter()
    mavenCentral()
}

val vertxVersion = "3.8.1"
val junitVersion = "5.3.2"
val slf4jVersion = "1.7.28"
val guavaVersion = "28.0-jre"
val lombokVersion = "1.18.8"
val commonsioVersion = "2.6"
val commonslang3Version = "3.9"
val commonsbeanutilsVersion = "1.9.3"
val commonscodecVersion = "1.12"

dependencies {
    implementation("io.vertx:vertx-core:$vertxVersion")
    implementation("io.vertx:vertx-web:$vertxVersion")
    implementation("io.vertx:vertx-web-client:$vertxVersion")

    implementation("commons-io:commons-io:$commonsioVersion")
    implementation("org.apache.commons:commons-lang3:$commonslang3Version")
    implementation("commons-beanutils:commons-beanutils:$commonsbeanutilsVersion")
    implementation("commons-codec:commons-codec:$commonscodecVersion")
    implementation("com.google.guava:guava:$guavaVersion")

    implementation("org.slf4j:slf4j-api:$slf4jVersion")
    implementation("org.slf4j:slf4j-simple:$slf4jVersion")

    compileOnly("org.projectlombok:lombok:$lombokVersion")
    annotationProcessor("org.projectlombok:lombok:$lombokVersion")
    testAnnotationProcessor("org.projectlombok:lombok:${lombokVersion}")
    testCompileOnly("org.projectlombok:lombok:$lombokVersion")

    testImplementation("org.junit.jupiter:junit-jupiter-api:$junitVersion")
    testImplementation("org.junit.jupiter:junit-jupiter-params:$junitVersion")
    testRuntime("org.junit.jupiter:junit-jupiter-engine:$junitVersion")

    testImplementation("io.vertx:vertx-junit5:$vertxVersion")
}

java {
    sourceCompatibility = JavaVersion.VERSION_1_8
    targetCompatibility = JavaVersion.VERSION_1_8
}

application {
    mainClassName = "io.vertx.core.Launcher"
}

val mainVerticleName = "com.example.VertxGatewayVerticle"
val watchForChange = "src/**/*.java"
val doOnChange = "${projectDir}/gradlew classes"

tasks {
    test {
        useJUnitPlatform()
    }

    getByName<JavaExec>("run") {
        args = listOf("run", mainVerticleName, "--redeploy=${watchForChange}", "--launcher-class=${application.mainClassName}", "--on-redeploy=${doOnChange}")
    }

    withType<ShadowJar> {
        manifest {
            attributes["Main-Verticle"] = mainVerticleName
        }
        mergeServiceFiles {
            include("META-INF/services/io.vertx.core.spi.VerticleFactory")
        }
    }
}


