<nav id="js-nav-menu" class="nav-menu hidden lg:hidden">
    <ul class="my-0">
        <li class="pl-4">
            <a
                title="{{ $page->siteName }} Blog"
                href="/blog"
                class="nav-menu__item hover:text-blue-500 {{ $page->isActive('/blog') ? 'active text-blue' : '' }}"
            >Blog</a>
        </li>
        <li class="pl-4">
            <a
                title="{{ $page->siteName }} Sobre"
                href="/sobre"
                class="nav-menu__item hover:text-blue-500 {{ $page->isActive('/sobre') ? 'active text-blue' : '' }}"
            >Sobre</a>
        </li>
        <li class="pl-4">
            <a
                title="{{ $page->siteName }} Contato"
                href="/contato"
                class="nav-menu__item hover:text-blue-500 {{ $page->isActive('/contato') ? 'active text-blue' : '' }}"
            >Contact</a>
        </li>
    </ul>
</nav>
