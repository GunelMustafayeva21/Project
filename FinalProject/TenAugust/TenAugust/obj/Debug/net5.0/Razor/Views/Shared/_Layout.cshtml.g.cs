#pragma checksum "C:\Users\Hp\source\repos\TenAugust\TenAugust\Views\Shared\_Layout.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "2f31782f4b9801e195c4c14a2c4238aeca10988b"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Shared__Layout), @"mvc.1.0.view", @"/Views/Shared/_Layout.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\Hp\source\repos\TenAugust\TenAugust\Views\_ViewImports.cshtml"
using TenAugust;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\Hp\source\repos\TenAugust\TenAugust\Views\_ViewImports.cshtml"
using TenAugust.Models;

#line default
#line hidden
#nullable disable
#nullable restore
#line 3 "C:\Users\Hp\source\repos\TenAugust\TenAugust\Views\_ViewImports.cshtml"
using TenAugust.ViewModels;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"2f31782f4b9801e195c4c14a2c4238aeca10988b", @"/Views/Shared/_Layout.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"33257636af8fef28bad2178094063647a8003921", @"/Views/_ViewImports.cshtml")]
    #nullable restore
    public class Views_Shared__Layout : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    #nullable disable
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\r\n");
#nullable restore
#line 2 "C:\Users\Hp\source\repos\TenAugust\TenAugust\Views\Shared\_Layout.cshtml"
Write(RenderBody());

#line default
#line hidden
#nullable disable
            WriteLiteral(@"

<!--Start of Tawk.to Script-->
<script type=""text/javascript"">
    var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
    (function () {
        var s1 = document.createElement(""script""), s0 = document.getElementsByTagName(""script"")[0];
        s1.async = true;
        s1.src = 'https://embed.tawk.to/630b926237898912e965c6f8/1gbij7mbe';
        s1.charset = 'UTF-8';
        s1.setAttribute('crossorigin', '*');
        s0.parentNode.insertBefore(s1, s0);
    })();
</script>
<!--End of Tawk.to Script-->
<script src=""https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js""
        integrity=""sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK""
        crossorigin=""anonymous""></script>
<script src=""https://code.jquery.com/jquery-3.6.0.min.js""
        integrity=""sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="" crossorigin=""anonymous""></script>

<script>

    /*Products Link*/
    $("".category"").click(function (e) {
        e.preventDefault()");
            WriteLiteral(@";
        $("".needing"").addClass(""d-none"");
        $("".needing."" + $(this).data(""target"")).removeClass(""d-none"");
    });
    /*Contact empty input*/
    if (document.querySelector(""#action-result"")) {
        alert(document.querySelector(""#action-result"").value);
    }
    /*Products Pagination*/
    let skip = 4;
    let productCount = $(""#product-count"").val();
    $("".load-product"").click(function (e) {
        e.preventDefault();
        $.ajax({
            url: ""/home/loadmoreproducts?skip="" + skip,
            method: ""get"",
            success: function (result) {
                $("".product-wrapper"").append(result);
                skip += 4;
                if (skip >= productCount) {
                    $("".load-product"").remove();
                }
            }

        })

    });

    /*Search*/
    $(""#search-input"").keyup(function () {
        let query = $(""#search-input"").val();
        if (query.length >= 3) {
            $.ajax({
                url: ""/h");
            WriteLiteral(@"ome/SearchProduct?query="" + query,
                method: ""get"",
                success: function (result) {
                    $("".product-wrapper"").empty();
                    $("".product-wrapper"").append(result);

                }
            })

        }
        else {
            $("".product-wrapper"").empty();
        }

    });





</script>

");
        }
        #pragma warning restore 1998
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591
