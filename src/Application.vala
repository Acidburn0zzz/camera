/*
 * Copyright (c) 2011-2016 Snap Developers (http://launchpad.net/snap-elementary)
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 *
 * Authored by: Marcus Wichelmann <marcus.wichelmann@hotmail.de>
 */

public class Snap.Application : Granite.Application {
    public static int main (string[] args) {
        ClutterGst.init (ref args);

        var application = new Application ();

        return application.run (args);
    }

    public MainWindow? main_window = null;

    construct {
        Intl.setlocale (LocaleCategory.ALL, "");

        build_data_dir = Config.DATADIR;
        build_pkg_data_dir = Config.PKGDATADIR;
        build_release_name = Config.RELEASE_NAME;
        build_version = Config.VERSION;
        build_version_info = Config.VERSION_INFO;

        program_name = _(Config.APP_NAME);
        exec_name = "snap-photobooth";
        app_years = "2011-2016";
        app_icon = "accessories-camera";
        app_launcher = "snap-photobooth.desktop";
        application_id = "org.pantheon.snap";
        main_url = "https://launchpad.net/snap-elementary";
        bug_url = "https://bugs.launchpad.net/snap-elementary";
        help_url = "https://answers.launchpad.net/snap-elementary";
        translate_url = "https://translations.launchpad.net/snap-elementary";
        about_authors = { "Marcus Wichelmann <marcus.wichelmann@hotmail.de>", "Mario Guerriero <mario@elementaryos.org>", null };
        about_artists = { "Daniel Fore <daniel.p.fore@gmail.com >", "Harvey Cabaguio <harveycabaguio@gmail.com>", null };
        about_translators = _("translator-credits");
        about_license_type = Gtk.License.GPL_3_0;
    }

    public Application () {
        /* TODO */
    }

    protected override void activate () {
        if (this.get_windows () == null) {
            main_window = new MainWindow (this);
            main_window.show_all ();
        } else {
            main_window.present ();
        }
    }
}
