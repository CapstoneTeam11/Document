package com.qaproject.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

/**
 * Created by khangtnse60992 on 6/9/2015.
 */
public class Utilities {
    public static void copyFileUsingJava7Files(File source, File dest)throws IOException {
        Files.copy(source.toPath(), dest.toPath());
    }

}
