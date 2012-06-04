This is the source code of facebook-research.com, released here per the privacy policy. This is a Ruby on Rails application, the code that parses Facebook is `lib/parser.rb`.

Privacy Policy
========================

**Note that the collected data is anonymized: name, location, email, profile pictures, etc. are not stored.** The source code of this app is made available here for public scrutiny.

While humans may occasionally browse the data, the collected data is intended to be consumed by special computer programs that automatically find relevant patterns.

All your individual friend feeds are collected by this app, but only the following data is retained:
*User data, including Facebook ID, language (locale), birthday (when available) and gender.
*All historial posts, including post type, number of tags, number of likes, comments and timestamp.

Aside from other researchers working on this project, this data will not be shared with third parties. Any concerns should be addressed to David Chouinard at david@tedxmontreal.com.

About the research project
-------------------------

As the quantity of online personal data grows at an astounding pace, death and preservation of digital assets pose increasingly important problems. Online troves of email messages, blog postings or Facebook photos are often precious to the family members of deceased users.

Currently, there is no way to systematically and reliably determine the death of an online user. Consequently, most service providers simply delete old, inactive accounts. If one could detect the death of a user, measures could be taken by a third party to permanently archive user data.

This project explores the development of a computational model to precisely and accurately detect death by analyzing Facebook interactions. Indeed, messages sent in response to the passing of a user have very characteristic content and a distinctive timing signature.