# = Class: yum::repo::ius
#
# This class installs the IUS repo.
#
# The IUS Community Project is aimed at providing up to date and regularly maintained RPM packages for
# the latest upstream versions of PHP, Python, MySQL and other common software specifically for Redhat
# Enterprise Linux. IUS can be thought of as a better way to upgrade RHEL, when you need to.
#
# http://iuscommunity.org/
#
# == Parameters: none
#
class yum::repo::ius {

  case $operatingsystem {
    'RedHat': {
      $osver = split($::operatingsystemrelease, '[.]')
      $osFullName = "Enterprise Linux ${osver[0]}"
      $osAbbr = "el${osver[0]}"
    }
    'CentOS': {
      $osver = split($::operatingsystemrelease, '[.]')
      $osFullName = "CentOS ${osver[0]}"
      $osAbbr = "centos${osver[0]}"
    }
    'Amazon': {
      $osver = [ '6' ]
      $osFullName = "Enterprise Linux 6"
      $osAbbr = "el6"
    }
    default: {
      fail("The IUS Yum Repo is only available for CentOS, RHEL, and Amazon Linux distributions.")
    }
  }

  yum::managed_yumrepo { 'ius':
    descr          => "IUS Community Packages for ${osFullName} - \$basearch",
    mirrorlist     => "http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-${osAbbr}&arch=\$basearch",
    enabled        => 1,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-IUS-COMMUNITY",
    gpgkey_source  => "puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-IUS-COMMUNITY",
    priority       => 14,
  }

  yum::managed_yumrepo { 'ius-debuginfo':
    descr          => "IUS Community Packages for ${osFullName} - \$basearch - Debug Info",
    mirrorlist     => "http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-${osAbbr}-debuginfo&arch=\$basearch",
    enabled        => 0,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-IUS-COMMUNITY",
    priority       => 14,
  }

  yum::managed_yumrepo { 'ius-source':
    descr          => "IUS Community Packages for ${osFullName} - \$basearch - Source",
    mirrorlist     => "http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-${osAbbr}-source&arch=\$basearch",
    enabled        => 0,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-IUS-COMMUNITY",
    priority       => 14,
  }

  yum::managed_yumrepo { 'ius-dev':
    descr          => "IUS Community Packages for ${osFullName} - \$basearch - Dev",
    mirrorlist     => "http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-${osAbbr}-dev&arch=\$basearch",
    enabled        => 0,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-IUS-COMMUNITY",
    gpgkey_source  => "puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-IUS-COMMUNITY",
    priority       => 15,
  }

  yum::managed_yumrepo { 'ius-dev-debuginfo':
    descr          => "IUS Community Packages for ${osFullName} - \$basearch - Dev Debug Info",
    mirrorlist     => "http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-${osAbbr}-dev-debuginfo&arch=\$basearch",
    enabled        => 0,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-IUS-COMMUNITY",
    priority       => 15,
  }

  yum::managed_yumrepo { 'ius-dev-source':
    descr          => "IUS Community Packages for ${osFullName} - \$basearch - Dev Source",
    mirrorlist     => "http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-${osAbbr}-dev-source&arch=\$basearch",
    enabled        => 0,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-IUS-COMMUNITY",
    priority       => 15,
  }

  yum::managed_yumrepo { 'ius-testing':
    descr          => "IUS Community Packages for ${osFullName} - \$basearch - Testing",
    mirrorlist     => "http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-${osAbbr}-testing&arch=\$basearch",
    enabled        => 0,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-IUS-COMMUNITY",
    gpgkey_source  => "puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-IUS-COMMUNITY",
    priority       => 15,
  }

  yum::managed_yumrepo { 'ius-testing-debuginfo':
    descr          => "IUS Community Packages for ${osFullName} - \$basearch - Testing Debug Info",
    mirrorlist     => "http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-${osAbbr}-testing-debuginfo&arch=\$basearch",
    enabled        => 0,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-IUS-COMMUNITY",
    priority       => 15,
  }

  yum::managed_yumrepo { 'ius-testing-source':
    descr          => "IUS Community Packages for ${osFullName} - \$basearch - Testing Source",
    mirrorlist     => "http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-${osAbbr}-testing-source&arch=\$basearch",
    enabled        => 0,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-IUS-COMMUNITY",
    priority       => 15,
  }

  yum::managed_yumrepo { 'ius-archive':
    descr          => "IUS Community Packages for ${osFullName} - \$basearch - Archive",
    mirrorlist     => "http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-${osAbbr}-archive&arch=\$basearch",
    enabled        => 0,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-IUS-COMMUNITY",
    gpgkey_source  => "puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-IUS-COMMUNITY",
    priority       => 15,
  }

  yum::managed_yumrepo { 'ius-archive-debuginfo':
    descr          => "IUS Community Packages for ${osFullName} - \$basearch - Archive Debug Info",
    mirrorlist     => "http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-${osAbbr}-archive-debuginfo&arch=\$basearch",
    enabled        => 0,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-IUS-COMMUNITY",
    priority       => 15,
  }

  yum::managed_yumrepo { 'ius-archive-source':
    descr          => "IUS Community Packages for ${osFullName} - \$basearch - Archive Source",
    mirrorlist     => "http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-${osAbbr}-archive-source&arch=\$basearch",
    enabled        => 0,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-IUS-COMMUNITY",
    priority       => 15,
  }

}

