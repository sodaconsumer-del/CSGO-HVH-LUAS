local l_ffi_0 = require("ffi");
local l_pui_0 = require("neverlose/pui");
local l_clipboard_0 = require("neverlose/clipboard");
local l_base64_0 = require("neverlose/base64");
local l_system_0 = require("neverlose/drag_system");
local l_gradient_0 = require("neverlose/gradient");
local l_lerp_0 = require("neverlose/lerp");
local function v10(...)
    -- upvalues: l_pui_0 (ref)
    local v7 = {
        ...
    };
    for v8, v9 in pairs(v7) do
        if type(v9) == "string" then
            v7[v8] = l_pui_0.string(v9);
        end;
    end;
    print_raw(l_pui_0.string("\v[luminaria] "), unpack(v7));
end;
l_pui_0.colors.lb = color(157, 168, 214);
files.create_folder("nl\\luminaria");
local v11 = {
    version = "Alpha", 
    path = "nl\\luminaria\\", 
    user = string.lower(common.get_username())
};
local v12 = {
    screensize = render.screen_size()
};
local v16 = {
    default = "eyJhY2NlbnQiOnsiY29sb3IiOiIjOURBOEQ2RkYifSwiYWRkb25zIjp7Imxpc3QiOlsxLjAsMi4wLDMuMCw0LjAsIn4iXX0sImFudGlhaW0iOnsiYnVpbGRlcnR5cGUiOjEuMCwiZmFrZWxhZ2VuYWJsZSI6dHJ1ZSwiZmFrZWxhZ3RpY2tzIjoxNC4wLCJmbGlja2VyIjpmYWxzZSwibWFudWFscyI6Im5vbmUiLCJzZWxlY3QiOiJtb3ZlIiwic3RlYWxlciI6eyJwbGlzdCI6MS4wfSwic3RlYWxzZWxlY3QiOiJhaXIiLCJ0YXJnZXQiOiJhdCB0YXJnZXQiLCJ+ZmFrZWxhZ2VuYWJsZSI6eyJ0eXBlcyI6Im5ldmVybG9zZSJ9LCJ+ZmxpY2tlciI6eyJzdGF0ZXMiOlsifiJdfSwifm1hbnVhbHMiOnsic3RhdGljIjp0cnVlfSwifnRhcmdldCI6eyJiYWNrc3RhYiI6dHJ1ZSwic2FmZSI6WyJrbmlmZSBpbiBhaXIrYyIsIn4iXX19LCJidWlsZGVyIjpbeyJjdXN0b20iOnsiZGVzeW5jIjp0cnVlLCJtb2RpZmllciI6ImxlZnQgLyByaWdodCIsIm92ZXJyaWRlIjp0cnVlLCJwaXRjaCI6ImRvd24iLCJ5YXciOiJiYWNrd2FyZCIsIn5kZXN5bmMiOnsiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0Ijo2MC4wLCJtb2RzIjpbIkppdHRlciIsIn4iXSwicmlnaHQiOjYwLjB9LCJ+bW9kaWZpZXIiOnsiYW5nbGUiOjAuMCwiZGVsYXkiOjEuMCwibGVmdCI6MjguMCwib2Zmc2V0IjowLjAsInJpZ2h0Ijo0NC4wfSwifnlhdyI6eyJvZmZzZXQiOjAuMH19LCJkZWZhdWx0Ijp7ImRlZmVuc2l2ZSI6Im9mZiIsImRlc3luYyI6dHJ1ZSwibW9kaWZpZXIiOiJub25lIiwib3ZlcnJpZGUiOnRydWUsInBpdGNoIjoiZG93biIsInlhdyI6ImJhY2t3YXJkIiwifmRlZmVuc2l2ZSI6eyJkZWxheSI6LTEuMCwib2Zmc2V0IjowLjAsInBpdGNoIjoib2ZmIiwicGl0Y2hvZmZzZXQiOjAuMCwicGl0Y2hvZmZzZXQyIjowLjAsInBpdGNodGltZSI6MjAuMCwicmFuZ2UiOjAuMCwic3luYyI6ImluZGVwZW5kZW50IiwieWF3Ijoib2ZmIn0sIn5kZXN5bmMiOnsiZnMiOiJwZWVrIHJlYWwiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnQiOjYwLjAsIm1vZHMiOlsiaml0dGVyIiwicmFuZG9taXplIGppdHRlciIsImFudGkgYnJ1dGVmb3JjZSIsIn4iXSwicmlnaHQiOjYwLjB9LCJ+bW9kaWZpZXIiOnsib2Zmc2V0IjowLjB9LCJ+eWF3Ijp7ImRlbGF5IjowLjAsImxlZnQiOjAuMCwib2Zmc2V0IjowLjAsInJhbmRvbWwiOjAuMCwicmFuZG9tciI6MC4wLCJyaWdodCI6MC4wfX19LHsiY3VzdG9tIjp7ImRlc3luYyI6dHJ1ZSwibW9kaWZpZXIiOiJsZWZ0IC8gcmlnaHQiLCJvdmVycmlkZSI6dHJ1ZSwicGl0Y2giOiJkb3duIiwieWF3IjoiYmFja3dhcmQiLCJ+ZGVzeW5jIjp7ImludmVydGVyIjpmYWxzZSwibGVmdCI6NjAuMCwibW9kcyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0Ijo2MC4wfSwifm1vZGlmaWVyIjp7ImFuZ2xlIjowLjAsImRlbGF5IjoxLjAsImxlZnQiOjIzLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6NDEuMH0sIn55YXciOnsib2Zmc2V0IjowLjB9fSwiZGVmYXVsdCI6eyJkZWZlbnNpdmUiOiJmb3JjZSIsImRlc3luYyI6dHJ1ZSwibW9kaWZpZXIiOiJub25lIiwib3ZlcnJpZGUiOnRydWUsInBpdGNoIjoiZG93biIsInlhdyI6ImxlZnQgLyByaWdodCIsIn5kZWZlbnNpdmUiOnsiZGVsYXkiOi0xLjAsIm9mZnNldCI6MC4wLCJwaXRjaCI6Im9mZiIsInBpdGNob2Zmc2V0IjowLjAsInBpdGNob2Zmc2V0MiI6MC4wLCJwaXRjaHRpbWUiOjIwLjAsInJhbmdlIjowLjAsInN5bmMiOiJpbmRlcGVuZGVudCIsInlhdyI6Im9mZiJ9LCJ+ZGVzeW5jIjp7ImZzIjoib2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0Ijo1Ni4wLCJtb2RzIjpbImppdHRlciIsIn4iXSwicmlnaHQiOjQ1LjB9LCJ+bW9kaWZpZXIiOnsib2Zmc2V0IjowLjB9LCJ+eWF3Ijp7ImRlbGF5IjowLjAsImxlZnQiOi0yMy4wLCJvZmZzZXQiOi03MS4wLCJyYW5kb21sIjowLjAsInJhbmRvbXIiOjAuMCwicmlnaHQiOjQzLjB9fX0seyJjdXN0b20iOnsiZGVzeW5jIjpmYWxzZSwibW9kaWZpZXIiOiJub25lIiwib3ZlcnJpZGUiOmZhbHNlLCJwaXRjaCI6Im9mZiIsInlhdyI6ImZvcndhcmQiLCJ+ZGVzeW5jIjp7ImludmVydGVyIjpmYWxzZSwibGVmdCI6MC4wLCJtb2RzIjpbIn4iXSwicmlnaHQiOjAuMH0sIn5tb2RpZmllciI6eyJhbmdsZSI6MC4wLCJkZWxheSI6MS4wLCJsZWZ0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MC4wfSwifnlhdyI6eyJvZmZzZXQiOjAuMH19LCJkZWZhdWx0Ijp7ImRlZmVuc2l2ZSI6ImFudGlhaW0iLCJkZXN5bmMiOnRydWUsIm1vZGlmaWVyIjoibm9uZSIsIm92ZXJyaWRlIjp0cnVlLCJwaXRjaCI6ImRvd24iLCJ5YXciOiJsZWZ0IC8gcmlnaHQiLCJ+ZGVmZW5zaXZlIjp7ImRlbGF5IjotMS4wLCJvZmZzZXQiOjAuMCwicGl0Y2giOiJvZmYiLCJwaXRjaG9mZnNldCI6MC4wLCJwaXRjaG9mZnNldDIiOjAuMCwicGl0Y2h0aW1lIjozMC4wLCJyYW5nZSI6MC4wLCJzeW5jIjoiaW5kZXBlbmRlbnQiLCJ5YXciOiJvZmYifSwifmRlc3luYyI6eyJmcyI6Im9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdCI6NDguMCwibW9kcyI6WyJqaXR0ZXIiLCJ+Il0sInJpZ2h0Ijo0MS4wfSwifm1vZGlmaWVyIjp7Im9mZnNldCI6MC4wfSwifnlhdyI6eyJkZWxheSI6MC4wLCJsZWZ0IjotMzMuMCwib2Zmc2V0IjowLjAsInJhbmRvbWwiOjAuMCwicmFuZG9tciI6MC4wLCJyaWdodCI6NDQuMH19fSx7ImN1c3RvbSI6eyJkZXN5bmMiOnRydWUsIm1vZGlmaWVyIjoibGVmdCAvIHJpZ2h0Iiwib3ZlcnJpZGUiOnRydWUsInBpdGNoIjoiZG93biIsInlhdyI6ImJhY2t3YXJkIiwifmRlc3luYyI6eyJpbnZlcnRlciI6ZmFsc2UsImxlZnQiOjYwLjAsIm1vZHMiOlsiSml0dGVyIiwifiJdLCJyaWdodCI6NjAuMH0sIn5tb2RpZmllciI6eyJhbmdsZSI6MC4wLCJkZWxheSI6My4wLCJsZWZ0IjoyNy4wLCJvZmZzZXQiOjY1LjAsInJpZ2h0IjozOC4wfSwifnlhdyI6eyJvZmZzZXQiOjAuMH19LCJkZWZhdWx0Ijp7ImRlZmVuc2l2ZSI6ImZvcmNlIiwiZGVzeW5jIjp0cnVlLCJtb2RpZmllciI6Im5vbmUiLCJvdmVycmlkZSI6dHJ1ZSwicGl0Y2giOiJkb3duIiwieWF3IjoibGVmdCAvIHJpZ2h0IiwifmRlZmVuc2l2ZSI6eyJkZWxheSI6LTEuMCwib2Zmc2V0IjowLjAsInBpdGNoIjoib2ZmIiwicGl0Y2hvZmZzZXQiOjAuMCwicGl0Y2hvZmZzZXQyIjowLjAsInBpdGNodGltZSI6MjAuMCwicmFuZ2UiOjAuMCwic3luYyI6ImluZGVwZW5kZW50IiwieWF3Ijoib2ZmIn0sIn5kZXN5bmMiOnsiZnMiOiJvZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnQiOjYwLjAsIm1vZHMiOlsiaml0dGVyIiwifiJdLCJyaWdodCI6NjAuMH0sIn5tb2RpZmllciI6eyJvZmZzZXQiOjAuMH0sIn55YXciOnsiZGVsYXkiOjAuMCwibGVmdCI6LTI1LjAsIm9mZnNldCI6LTc2LjAsInJhbmRvbWwiOjAuMCwicmFuZG9tciI6MC4wLCJyaWdodCI6NDkuMH19fSx7ImN1c3RvbSI6eyJkZXN5bmMiOnRydWUsIm1vZGlmaWVyIjoibGVmdCAvIHJpZ2h0Iiwib3ZlcnJpZGUiOnRydWUsInBpdGNoIjoiZG93biIsInlhdyI6ImJhY2t3YXJkIiwifmRlc3luYyI6eyJpbnZlcnRlciI6ZmFsc2UsImxlZnQiOjYwLjAsIm1vZHMiOlsiSml0dGVyIiwiQW50aSBCcnV0ZWZvcmNlIiwifiJdLCJyaWdodCI6NjAuMH0sIn5tb2RpZmllciI6eyJhbmdsZSI6MC4wLCJkZWxheSI6NS4wLCJsZWZ0IjoyMi4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjQ5LjB9LCJ+eWF3Ijp7Im9mZnNldCI6MC4wfX0sImRlZmF1bHQiOnsiZGVmZW5zaXZlIjoiZm9yY2UiLCJkZXN5bmMiOnRydWUsIm1vZGlmaWVyIjoibm9uZSIsIm92ZXJyaWRlIjp0cnVlLCJwaXRjaCI6ImRvd24iLCJ5YXciOiJsZWZ0IC8gcmlnaHQiLCJ+ZGVmZW5zaXZlIjp7ImRlbGF5IjotMS4wLCJvZmZzZXQiOi0zNi4wLCJwaXRjaCI6ImN1c3RvbSIsInBpdGNob2Zmc2V0IjotMzYuMCwicGl0Y2hvZmZzZXQyIjowLjAsInBpdGNodGltZSI6MjAuMCwicmFuZ2UiOjAuMCwic3luYyI6ImluZGVwZW5kZW50IiwieWF3Ijoib2ZmIn0sIn5kZXN5bmMiOnsiZnMiOiJvZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnQiOjYwLjAsIm1vZHMiOlsiaml0dGVyIiwifiJdLCJyaWdodCI6NjAuMH0sIn5tb2RpZmllciI6eyJvZmZzZXQiOjAuMH0sIn55YXciOnsiZGVsYXkiOjAuMCwibGVmdCI6LTIyLjAsIm9mZnNldCI6MC4wLCJyYW5kb21sIjowLjAsInJhbmRvbXIiOjAuMCwicmlnaHQiOjQ5LjB9fX0seyJjdXN0b20iOnsiZGVzeW5jIjp0cnVlLCJtb2RpZmllciI6ImxlZnQgLyByaWdodCIsIm92ZXJyaWRlIjp0cnVlLCJwaXRjaCI6ImRvd24iLCJ5YXciOiJiYWNrd2FyZCIsIn5kZXN5bmMiOnsiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0Ijo2MC4wLCJtb2RzIjpbIkppdHRlciIsIn4iXSwicmlnaHQiOjYwLjB9LCJ+bW9kaWZpZXIiOnsiYW5nbGUiOjAuMCwiZGVsYXkiOjQuMCwibGVmdCI6MjkuMCwib2Zmc2V0IjowLjAsInJpZ2h0Ijo0Ni4wfSwifnlhdyI6eyJvZmZzZXQiOjAuMH19LCJkZWZhdWx0Ijp7ImRlZmVuc2l2ZSI6ImZvcmNlIiwiZGVzeW5jIjp0cnVlLCJtb2RpZmllciI6Im5vbmUiLCJvdmVycmlkZSI6dHJ1ZSwicGl0Y2giOiJkb3duIiwieWF3IjoibGVmdCAvIHJpZ2h0IiwifmRlZmVuc2l2ZSI6eyJkZWxheSI6LTEuMCwib2Zmc2V0IjotOS4wLCJwaXRjaCI6ImN1c3RvbSIsInBpdGNob2Zmc2V0IjotOS4wLCJwaXRjaG9mZnNldDIiOjAuMCwicGl0Y2h0aW1lIjoyMC4wLCJyYW5nZSI6MC4wLCJzeW5jIjoiaW5kZXBlbmRlbnQiLCJ5YXciOiJvZmYifSwifmRlc3luYyI6eyJmcyI6Im9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdCI6NjAuMCwibW9kcyI6WyJqaXR0ZXIiLCJ+Il0sInJpZ2h0Ijo2MC4wfSwifm1vZGlmaWVyIjp7Im9mZnNldCI6MC4wfSwifnlhdyI6eyJkZWxheSI6MC4wLCJsZWZ0IjotMjcuMCwib2Zmc2V0IjowLjAsInJhbmRvbWwiOjAuMCwicmFuZG9tciI6MC4wLCJyaWdodCI6MzguMH19fSx7ImN1c3RvbSI6eyJkZXN5bmMiOnRydWUsIm1vZGlmaWVyIjoibGVmdCAvIHJpZ2h0Iiwib3ZlcnJpZGUiOnRydWUsInBpdGNoIjoiZG93biIsInlhdyI6ImJhY2t3YXJkIiwifmRlc3luYyI6eyJpbnZlcnRlciI6ZmFsc2UsImxlZnQiOjYwLjAsIm1vZHMiOlsiSml0dGVyIiwifiJdLCJyaWdodCI6NjAuMH0sIn5tb2RpZmllciI6eyJhbmdsZSI6MC4wLCJkZWxheSI6MS4wLCJsZWZ0IjoyMi4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjQ2LjB9LCJ+eWF3Ijp7Im9mZnNldCI6MC4wfX0sImRlZmF1bHQiOnsiZGVmZW5zaXZlIjoiZm9yY2UiLCJkZXN5bmMiOnRydWUsIm1vZGlmaWVyIjoibm9uZSIsIm92ZXJyaWRlIjp0cnVlLCJwaXRjaCI6ImRvd24iLCJ5YXciOiJsZWZ0IC8gcmlnaHQiLCJ+ZGVmZW5zaXZlIjp7ImRlbGF5IjotMS4wLCJvZmZzZXQiOi03LjAsInBpdGNoIjoiY3VzdG9tIiwicGl0Y2hvZmZzZXQiOi03LjAsInBpdGNob2Zmc2V0MiI6MC4wLCJwaXRjaHRpbWUiOjIwLjAsInJhbmdlIjowLjAsInN5bmMiOiJpbmRlcGVuZGVudCIsInlhdyI6Im9mZiJ9LCJ+ZGVzeW5jIjp7ImZzIjoib2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0Ijo2MC4wLCJtb2RzIjpbImppdHRlciIsIn4iXSwicmlnaHQiOjYwLjB9LCJ+bW9kaWZpZXIiOnsib2Zmc2V0IjowLjB9LCJ+eWF3Ijp7ImRlbGF5IjowLjAsImxlZnQiOi0yNy4wLCJvZmZzZXQiOi00NC4wLCJyYW5kb21sIjowLjAsInJhbmRvbXIiOjAuMCwicmlnaHQiOjM4LjB9fX0seyJjdXN0b20iOnsiZGVzeW5jIjp0cnVlLCJtb2RpZmllciI6ImxlZnQgLyByaWdodCIsIm92ZXJyaWRlIjp0cnVlLCJwaXRjaCI6ImRvd24iLCJ5YXciOiJiYWNrd2FyZCIsIn5kZXN5bmMiOnsiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0Ijo2MC4wLCJtb2RzIjpbIkppdHRlciIsIn4iXSwicmlnaHQiOjYwLjB9LCJ+bW9kaWZpZXIiOnsiYW5nbGUiOjAuMCwiZGVsYXkiOjUuMCwibGVmdCI6MjIuMCwib2Zmc2V0IjowLjAsInJpZ2h0Ijo0Ni4wfSwifnlhdyI6eyJvZmZzZXQiOjAuMH19LCJkZWZhdWx0Ijp7ImRlZmVuc2l2ZSI6ImZvcmNlIiwiZGVzeW5jIjp0cnVlLCJtb2RpZmllciI6Im5vbmUiLCJvdmVycmlkZSI6dHJ1ZSwicGl0Y2giOiJkb3duIiwieWF3IjoibGVmdCAvIHJpZ2h0IiwifmRlZmVuc2l2ZSI6eyJkZWxheSI6LTEuMCwib2Zmc2V0IjotODQuMCwicGl0Y2giOiJqaXR0ZXIiLCJwaXRjaG9mZnNldCI6LTg0LjAsInBpdGNob2Zmc2V0MiI6LTcwLjAsInBpdGNodGltZSI6MjAuMCwicmFuZ2UiOjAuMCwic3luYyI6ImluZGVwZW5kZW50IiwieWF3IjoicmFuZG9tIn0sIn5kZXN5bmMiOnsiZnMiOiJvZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnQiOjYwLjAsIm1vZHMiOlsiaml0dGVyIiwifiJdLCJyaWdodCI6NjAuMH0sIn5tb2RpZmllciI6eyJvZmZzZXQiOjAuMH0sIn55YXciOnsiZGVsYXkiOjAuMCwibGVmdCI6LTIyLjAsIm9mZnNldCI6LTY1LjAsInJhbmRvbWwiOjAuMCwicmFuZG9tciI6MC4wLCJyaWdodCI6MzguMH19fV0sImNvbmZpZyI6eyJjb25maWdsaXN0IjoyLjAsImNvbmZpZ25hbWUiOiJleHRyZWFtIiwibW9kZSI6ImxvY2FsIn0sImhlbHBlcnMiOnsiY3VzdG9temV1cyI6dHJ1ZSwiZml4cmV2byI6dHJ1ZSwiaW5kaWNhdG9ycyI6dHJ1ZSwic21hcnRib2R5IjpmYWxzZSwic21hcnRqdW1wIjp0cnVlLCJzbWFydHNhZmUiOnRydWUsIn5pbmRpY2F0b3JzIjp7Im9uX3BlZWsiOmZhbHNlLCJvcHRpb25zIjpbImJhaW0iLCJzYWZlIiwiemV1cyIsInJldm8iLCJqdW1wc2NvdXQgaGl0Y2hhbmNlIiwifiJdfSwifnNtYXJ0anVtcCI6eyJkaXN0YW5jZSI6NjAuMCwib3B0aW9ucyI6WyJhZGFwdGl2ZSBoaXRjaGFuY2UiLCJsaW1pdCB2ZWxvY2l0eSIsIn4iXSwidmVsb2NpdHkiOjIyOC4wfSwifnNtYXJ0c2FmZSI6eyJtb2RlIjoicHJlZmVyIiwib3B0aW9ucyI6WyJ+Il19fSwiaGlkZGVuIjp7ImRtZ194Ijo5NjMuMCwiZG1nX3kiOjUyNy4wLCJwYW5lbF94IjowLjAsInBhbmVsX3kiOjUxOS4wLCJzb2x1c194Ijo0NDIuMCwic29sdXNfeSI6NDgyLjB9LCJtaXNjIjp7ImFuaW1hdGlvbiI6dHJ1ZSwiY2xhbnRhZyI6dHJ1ZSwibGFkZGVyIjp0cnVlLCJsb2dzIjp0cnVlLCJtb2RlbCI6ZmFsc2UsIm5hZGVmaXgiOnRydWUsInBpbmdfc3Bpa2UiOnRydWUsInRyYXNodGFsayI6ZmFsc2UsIndhbGxzIjpmYWxzZSwifmFuaW1hdGlvbiI6eyJhaXIiOiJzdGF0aWMiLCJncm91bmQiOiJza2VldCIsImxlYW4iOjAuMCwic2xpZGUiOlsifiJdfSwifmxvZ3MiOnsiY29sb3IiOiIjRjM2OTY5RkYiLCJzY3JlZW4iOiJhbHRlcm5hdGl2ZSIsInR5cGVzIjpbIm9uIHNjcmVlbiIsImNvbnNvbGUiLCJ0b3AgbGVmdCIsIn4iXX0sIn5tb2RlbCI6eyJuYWRlIjoyNTUuMCwic2NvcGUiOjE3MS4wLCJ0eXBlcyI6WyJvbiBOYWRlIiwifiJdfSwifnBpbmdfc3Bpa2UiOnsiYW1vdW50IjoyMDAuMH0sIn50cmFzaHRhbGsiOnsidHlwZXMiOiJhZHZlcnRpc2VtZW50In0sIn53YWxscyI6eyJkaXN0YW5jZSI6Mi4wfX0sIm1vZGUiOjEuMCwidmlzdWFscyI6eyJhc3BlY3QiOnRydWUsImN1c3RvbXMiOmZhbHNlLCJkYW1hZ2VfaW5kaWNhdG9yIjp0cnVlLCJoaXRtYXJrZXIiOnRydWUsImluZGljYXRvcnMiOnRydWUsImluZGljYXRvcnNfeHlpbmkiOmZhbHNlLCJwYW5lbCI6dHJ1ZSwic29sdXMiOnRydWUsInZpZXdtb2RlbCI6ZmFsc2UsIndhcm5pbmdzIjp0cnVlLCJ+YXNwZWN0Ijp7ImFtb3VudCI6MTI4LjB9LCJ+Y3VzdG9tcyI6eyJjb2xvciI6IiM5REE4RDZGRiJ9LCJ+ZGFtYWdlX2luZGljYXRvciI6eyJmb250IjoicGl4ZWwiLCJsZXJwIjpmYWxzZSwibW9kcyI6Im92ZXJyaWRlIG9ubHkifSwifmhpdG1hcmtlciI6eyJjb2xvciI6IiNGRkZGRkZGRiJ9LCJ+aW5kaWNhdG9ycyI6eyJjb2xvciI6IiNDNUM1QzU5RiIsIml0ZW1zIjpbImRvdWJsZXRhcCIsImhpZGVzaG90cyIsImRhbWFnZSIsImZyZWVzdGFuZCIsImZha2VkdWNrIiwiYmFpbSIsInNhZmVwb2ludCIsIn4iXX0sIn5pbmRpY2F0b3JzX3h5aW5pIjp7InR5cGVzIjpbIn4iXX0sIn5wYW5lbCI6eyJjb2xvciI6IiNGMzY5NjlGRiJ9LCJ+c29sdXMiOnsiY29sb3IiOiIjRjM2OTY5RkYifSwifnZpZXdtb2RlbCI6eyJmb3YiOjYwLjAsIngiOjEwLjAsInkiOjEwLjAsInoiOi0xNS4wfSwifndhcm5pbmdzIjp7ImNvbG9yIjoiI0ZGRkZGRkZGIiwidHlwZXMiOlsidmVsb2NpdHkiLCJ+Il19fX0=", 
    path = "nl\\luminaria\\luminaria.cfg", 
    check = function(v13)
        -- upvalues: v10 (ref)
        if not files.read(v13.path) or files.read(v13.path) == "[]" then
            local v14 = {
                default = v13.default
            };
            files.create_folder("nl\\luminaria");
            files.write(v13.path, json.stringify(v14));
        end;
        if json.parse(files.read(v13.path)).default ~= v13.default then
            local v15 = json.parse(files.read(v13.path));
            v15.default = v13.default;
            files.write(v13.path, json.stringify(v15));
            v10("Updated default config");
        end;
    end
};
local v17 = {
    size = render.screen_size(), 
    scale = render.screen_size().x / 1920
};
local v18 = {
    slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    yaw_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    yaw_modifier_degree = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    body_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    fs_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    fs_disable_yaw_mod = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    fs_body_fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
    roll_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
    roll_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    lag_option = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    hideshots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    hslag = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    autopeek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    baim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    safe = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    mindmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
    hitchance_zeus = ui.find("Aimbot", "Ragebot", "Selection", "Taser", "Hit Chance"), 
    hitchance_scout = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"), 
    autostop_scout = ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Options"), 
    airstrafe = ui.find("Miscellaneous", "Main", "Movement", "air Strafe"), 
    legmovement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    fakeping = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    fakelagenable = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
    fakelaglimit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
    speed = ui.find("Settings", "Animation Speed"), 
    attarget = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base")
};
local v19 = {
    [0] = "generic", 
    [1] = "head", 
    [2] = "chest", 
    [3] = "stomach", 
    [4] = "left arm", 
    [5] = "right arm", 
    [6] = "left leg", 
    [7] = "right leg", 
    [8] = "neck", 
    [9] = "generic", 
    [10] = "gear"
};
local v30 = {
    db = {}, 
    is_active = function(v20, v21, v22, v23)
        if not v23 then
            v23 = false;
        end;
        if type(v21) == "number" then
            v21 = entity.get(v21);
        end;
        if v21 == nil or not v21 then
            return;
        else
            local v24 = v21.get_index(v21);
            local l_tickcount_0 = globals.tickcount;
            local v26 = to_ticks(v21.m_flSimulationTime or 0);
            v20.db[v24] = v20.db[v24] and v20.db[v24] or {
                last_sim_time = 0, 
                defensive_until = 0
            };
            if v20.db[v24].last_sim_time == 0 then
                v20.db[v24].last_sim_time = v26;
                if v22 then

                end;
                return {
                    tick = 0, 
                    active = false
                };
            else
                local v27 = v26 - v20.db[v24].last_sim_time;
                if v27 < 0 then
                    v20.db[v24].defensive_until = l_tickcount_0 + math.abs(v27);
                    if v22 then
                        v20.db[v24].defensive_until = v20.db[v24].defensive_until - to_ticks(utils.net_channel().latency[0]);
                    end;
                end;
                v20.db[v24].last_sim_time = v26;
                local v28 = {
                    tick = v20.db[v24].defensive_until or 0
                };
                local v29;
                if not v20.db[v24].defensive_until or l_tickcount_0 >= v20.db[v24].defensive_until then
                    v29 = false;
                else
                    v29 = true;
                end;
                v28.active = v29;
                return v23 and v28 or l_tickcount_0 < v20.db[v24].defensive_until;
            end;
        end;
    end
};
local v31 = {
    AIM_BLEND_STAND_WALK = 14, 
    AIM_BLEND_STAND_IDLE = 13, 
    BODY_PITCH = 12, 
    BODY_YAW = 11, 
    MOVE_BLEND_RUN = 10, 
    MOVE_BLEND_WALK = 9, 
    MOVE_BLEND_CROUCH = 8, 
    MOVE_YAW = 7, 
    JUMP_FALL = 6, 
    LADDER_SPEED = 5, 
    LADDER_YAW = 4, 
    SPEED = 3, 
    LEAN_YAW = 2, 
    STAND = 1, 
    STRAFE_YAW = 0, 
    DEATH_YAW = 18, 
    AIM_BLEND_CROUCH_WALK = 17, 
    AIM_BLEND_CROUCH_IDLE = 16, 
    AIM_BLEND_STAND_RUN = 14
};
l_ffi_0.cdef("    typedef unsigned long HANDLE;\n    typedef HANDLE HWND;\n    typedef const char *LPCTSTR;\n    HWND GetForegroundWindow();\n    bool SetWindowTextA(HWND hWnd, LPCTSTR lpString);\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n    typedef struct { uint8_t r; uint8_t g; uint8_t b; uint8_t a; } color_struct_t;\n    typedef void (__cdecl* console_color_print)(void*,const color_struct_t&, const char*, ...);\n\n    typedef struct {\n        float x;\n        float y;\n        float z;\n    } vector_t;\n\n    // 3d vector struct\n\n    // animstate structs; used to override animations\n    typedef struct\n    {\n        char    pad0[0x60]; // 0x00\n        void* pEntity; // 0x60\n        void* pActiveWeapon; // 0x64\n        void* pLastActiveWeapon; // 0x68\n        float        flLastUpdateTime; // 0x6C\n        int            iLastUpdateFrame; // 0x70\n        float        flLastUpdateIncrement; // 0x74\n        float        flEyeYaw; // 0x78\n        float        flEyePitch; // 0x7C\n        float        flGoalFeetYaw; // 0x80\n        float        flLastFeetYaw; // 0x84\n        float        flMoveYaw; // 0x88\n        float        flLastMoveYaw; // 0x8C // changes when moving/jumping/hitting ground\n        float        flLeanAmount; // 0x90\n        char    pad1[0x4]; // 0x94\n        float        flFeetCycle; // 0x98 0 to 1\n        float        flMoveWeight; // 0x9C 0 to 1\n        float        flMoveWeightSmoothed; // 0xA0\n        float        flDuckAmount; // 0xA4\n        float        flHitGroundCycle; // 0xA8\n        float        flRecrouchWeight; // 0xAC\n        vector_t        vecOrigin; // 0xB0\n        vector_t        vecLastOrigin;// 0xBC\n        vector_t        vecVelocity; // 0xC8\n        vector_t        vecVelocityNormalized; // 0xD4\n        vector_t        vecVelocityNormalizedNonZero; // 0xE0\n        vector_t        flVelocityLenght2D; // 0xEC\n        float        flJumpFallVelocity; // 0xF0\n        float        flSpeedNormalized; // 0xF4 // clamped velocity from 0 to 1\n        float m_flFeetSpeedForwardsOrSideWays; //0xF8\n        float m_flFeetSpeedUnknownForwardOrSideways; //0xFC\n        float        flRunningSpeed; // 0xF8\n        float        flDuckingSpeed; // 0xFC\n        float        flDurationMoving; // 0x100\n        float        flDurationStill; // 0x104\n        bool        bOnGround; // 0x108\n        bool        bHitGroundAnimation; // 0x109\n        char    pad2[0x2]; // 0x10A\n        float        flNextLowerBodyYawUpdateTime; // 0x10C\n        float        flDurationInAir; // 0x110\n        float        flLeftGroundHeight; // 0x114\n        float m_flStopToFullRunningFraction; //0x116\n        float        flHitGroundWeight; // 0x118 // from 0 to 1, is 1 when standing\n        float        flWalkToRunTransition; // 0x11C // from 0 to 1, doesnt change when walking or crouching, only running\n        char    pad3[0x4]; // 0x120\n        float        flAffectedFraction; // 0x124 // affected while jumping and running, or when just jumping, 0 to 1\n        char    pad4[0x208]; // 0x128\n        float        flMinBodyYaw; // 0x330\n        float        flMaxBodyYaw; // 0x334\n        float        flMinPitch; //0x338\n        float        flMaxPitch; // 0x33C\n        int            iAnimsetVersion; // 0x340\n    } CPlayer_Animation_State;\n\n\n    // resolver strucs number 2 lulz\n    typedef struct\n    {\n        float   m_anim_time;\t\t\n        float   m_fade_out_time;\t\n        int     m_flags;\t\t\t\n        int     m_activity;\t\t\t\n        int     m_priority;\t\t\t\n        int     m_order;\t\t\t\n        int     m_sequence;\t\t\t\n        float   m_prev_cycle;\t\t\n        float   m_weight;\t\t\t\n        float   m_weight_delta_rate;\n        float   m_playback_rate;\t\n        float   m_cycle;\t\t\t\n        void* m_owner;\t\t\t\n        int     m_bits;\t\t\t\t\n    } C_AnimationLayer;\n\n    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n");
local v32 = l_ffi_0.load("UrlMon");
local v33 = l_ffi_0.load("WinInet");
local v36 = {
    this_call = function(v34, v35)
        return function(...)
            -- upvalues: v34 (ref), v35 (ref)
            return v34(v35, ...);
        end;
    end, 
    entity_list_003 = l_ffi_0.cast(l_ffi_0.typeof("uintptr_t**"), utils.create_interface("client.dll", "VClientEntityList003"))
};
local v37 = v36.this_call(l_ffi_0.cast("get_client_entity_t", v36.entity_list_003[0][3]), v36.entity_list_003);
local _ = false;
local v39 = false;
local v59 = {
    lerp = function(v40, v41, v42)
        if v40 == v41 then
            return v41;
        else
            v42 = v42 * (globals.frametime * 170);
            local v43 = v40 + (v41 - v40) * v42;
            if math.abs(v43 - v41) < 0.01 then
                return v41;
            else
                return v43;
            end;
        end;
    end, 
    animation = {
        speed = 0.07, 
        database = {}, 
        lerp = function(v44, v45, v46)
            return v44 + (v45 - v44) * (globals.frametime * v46);
        end, 
        new = function(v47, v48, v49, v50, v51)
            if not v50 then
                v50 = v47.speed;
            end;
            if v47.database[v48] == nil then
                v47.database[v48] = v51 and v51 or 0;
            end;
            v47.database[v48] = v47.lerp(v47.database[v48], v49, v50);
            return v47.database[v48];
        end
    }, 
    round = function(v52)
        return math.floor(v52 + 0.5);
    end, 
    download = function(v53, v54)
        -- upvalues: v11 (ref), v33 (ref), v32 (ref)
        if files.read(v11.path .. "\\" .. v54) == nil then
            v33.DeleteUrlCacheEntryA(v53);
            v32.URLDownloadToFileA(nil, v53, v11.path .. v54, 0, 0);
        end;
    end, 
    is_right_clicking = function()
        -- upvalues: v39 (ref)
        local v55 = common.is_button_down(2);
        if v55 == nil then
            return false;
        elseif not v39 and v55 then
            v39 = true;
            return true;
        elseif v55 and v39 then
            return false;
        elseif v39 and not v55 then
            v39 = false;
            return false;
        else
            return;
        end;
    end, 
    is_left_clicking = function()
        -- upvalues: v39 (ref)
        local v56 = common.is_button_down(1);
        if v56 == nil then
            return false;
        elseif not v39 and v56 then
            v39 = true;
            return true;
        elseif v56 and v39 then
            return false;
        elseif v39 and not v56 then
            v39 = false;
            return false;
        else
            return;
        end;
    end, 
    get_anim_layer = function(v57, v58)
        -- upvalues: l_ffi_0 (ref)
        if not v58 then
            v58 = 1;
        end;
        v57 = l_ffi_0.cast(l_ffi_0.typeof("void***"), v57);
        return l_ffi_0.cast("C_AnimationLayer**", l_ffi_0.cast("char*", v57) + 10640)[0][v58];
    end
};
v59.download("https://github.com/ItsVladGames/funnyfilestorage/raw/main/matrix.png", "image.png");
v59.download("https://github.com/ItsVladGames/funnyfilestorage/raw/main/default.jpg", "default.jpg");
v59.download("https://github.com/ItsVladGames/funnyfilestorage/raw/main/calibrib.ttf", "calibrib.ttf");
local v60 = {
    xane = render.load_image_from_file(v11.path .. "image.png", vector(20, 20)), 
    default = render.load_image_from_file(v11.path .. "default.jpg", vector(20, 20))
};
local v61 = {
    verdana = render.load_font("Verdana", 11, "a"), 
    gs_font = render.load_font("nl\\luminaria\\calibrib.ttf", vector(25, 22, -1), "a, d")
};
local v103 = {
    aspectratio = 0, 
    anglespitch = {
        down = 89, 
        ["0"] = 0, 
        up = -89
    }, 
    anglesyaw = {
        backward = 180, 
        forward = 0, 
        freestand = 180, 
        right = -90, 
        left = 90
    }, 
    conditions = {
        [1] = "global", 
        [2] = "stand", 
        [3] = "slow", 
        [4] = "move", 
        [5] = "duck", 
        [6] = "duck+m", 
        [7] = "air", 
        [8] = "air+c"
    }, 
    state = {}, 
    inair = function(v62)
        local l_m_fFlags_0 = v62.m_fFlags;
        return bit.band(l_m_fFlags_0, 1) == 0;
    end, 
    iscrouching = function(v64)
        local l_m_fFlags_1 = v64.m_fFlags;
        return bit.band(l_m_fFlags_1, 4) == 4;
    end, 
    getvelocity = function(v66)
        if v66 == nil then
            return;
        else
            return v66.m_vecVelocity:length();
        end;
    end, 
    updatestate = function(v67, v68)
        -- upvalues: v18 (ref)
        local v69 = entity.get_local_player();
        if not v69 then
            return;
        else
            local v70 = v67.getvelocity(v69);
            local l_m_fFlags_2 = v69.m_fFlags;
            local v72 = bit.lshift(1, 1);
            local v73 = bit.lshift(1, 0);
            local v74 = {
                state = 0, 
                name = ""
            };
            if bit.band(l_m_fFlags_2, v73) == 1 and v70 < 3 and bit.band(l_m_fFlags_2, v72) == 0 then
                v74.name = "stand";
                v74.state = 2;
            elseif bit.band(l_m_fFlags_2, v73) == 1 and v70 > 3 and bit.band(l_m_fFlags_2, v72) == 0 and v18.slowwalk:get() then
                v74.name = "slow";
                v74.state = 3;
            end;
            if bit.band(l_m_fFlags_2, v73) == 1 and v70 > 3 and bit.band(l_m_fFlags_2, v72) == 0 and not v18.slowwalk:get() and not v68.in_jump then
                v74.name = "move";
                v74.state = 4;
            end;
            if bit.band(l_m_fFlags_2, v73) == 1 and bit.band(l_m_fFlags_2, v72) > 0.9 and v70 > 10 and not v68.in_jump then
                v74.name = "duck+m";
                v74.state = 6;
            elseif bit.band(l_m_fFlags_2, v73) == 1 and bit.band(l_m_fFlags_2, v72) > 0.9 and not v68.in_jump then
                v74.name = "duck";
                v74.state = 5;
            end;
            if (v68.in_jump or bit.band(l_m_fFlags_2, v73) == 0) and bit.band(l_m_fFlags_2, v72) == 0 then
                v74.name = "air";
                v74.state = 7;
            end;
            if (v68.in_jump or bit.band(l_m_fFlags_2, v73) == 0) and bit.band(l_m_fFlags_2, v72) > 0.9 then
                v74.name = "air+c";
                v74.state = 8;
            end;
            v67.state = v74;
            return;
        end;
    end, 
    closestpointtoray = function(v75, v76, v77)
        local v78 = v75 - v76;
        local v79 = v77 - v76;
        local v80 = #v79;
        v79.x = v79.x / v80;
        v79.y = v79.y / v80;
        v79.z = v79.z / v80;
        local v81 = v79.x * v78.x + v79.y * v78.y + v79.z * v78.z;
        if v81 < 0 then
            return v76;
        elseif v80 < v81 then
            return v77;
        else
            return vector(v76.x + v79.x * v81, v76.y + v79.y * v81, v76.z + v79.z * v81);
        end;
    end, 
    shouldsafehead = function(v82)
        local v83 = entity.get_local_player();
        local v84 = v83:get_player_weapon():get_weapon_info().weapon_name or "nil";
        if v82:get("Above Enemy") and v83:get_origin().z - entity.get_threat(false):get_origin().z > v82.height:get() then
            return true;
        elseif v82:get("Knife") and v84 == "weapon_knife" then
            return true;
        elseif v82:get("Taser") and v84 == "weapon_taser" then
            return true;
        else
            return false;
        end;
    end, 
    anglevectors = function(v85, v86)
        local v87 = math.sin(math.rad(v85));
        local v88 = math.sin(math.rad(v86));
        local v89 = math.cos(math.rad(v85));
        local v90 = math.cos(math.rad(v86));
        return vector(v89 * v90, v89 * v88, -v87);
    end, 
    round = function(v91, v92)
        local v93 = math.pow(10, v92 or 0);
        local v94 = v91 * v93;
        if v94 >= 0 then
            v94 = math.floor(v94 + 0.5);
        else
            v94 = math.ceil(v94 - 0.5);
        end;
        return v94 / v93;
    end, 
    shouldantiaim = function(v95)
        local l_m_bFreezePeriod_0 = entity.get_game_rules().m_bFreezePeriod;
        local v97 = entity.get_local_player();
        if v97:get_player_weapon():get_weapon_info().weapon_type == 9 then
            return (v97:get_player_weapon().m_fThrowTime or 0) == 0;
        elseif v95.in_attack then
            return v97:get_player_weapon().m_flNextPrimaryAttack > globals.curtime;
        else
            return (v97.m_movetype == 9 or v95.in_use or l_m_bFreezePeriod_0) == false;
        end;
    end, 
    normalizeyaw = function(v98)
        return math.fmod(v98 + 180, 360) - 180;
    end, 
    calculateattarget = function(_, v100)
        local v101 = entity.get_threat();
        if v101 == nil then
            return 0;
        else
            local v102 = entity.get_local_player():get_origin();
            return ((v101:get_origin() - v102):angles() - v100).y;
        end;
    end
};
local v104 = {
    home = l_pui_0.create("\f<house>", "home", 1), 
    config = l_pui_0.create("\f<house>", "config", 2), 
    addons = l_pui_0.create("\f<house>", "addons", 2), 
    antiaim = l_pui_0.create("\f<user-group>", "main", 1), 
    stealer = l_pui_0.create("\f<user-group>", "\n", 1), 
    plist = l_pui_0.create("\f<user-group>", "\n\n", 2), 
    fakelag = l_pui_0.create("\f<user-group>", "fakelag", 1), 
    builder = l_pui_0.create("\f<user-group>", "builder", 2), 
    helpers = l_pui_0.create("\f<gear>", "RAGEBOT", 1), 
    helpers2 = l_pui_0.create("\f<gear>", " ", 2), 
    screen = l_pui_0.create("\f<gear>", "visuals", 1), 
    misc = l_pui_0.create("\f<gear>", "misc", 2)
};
local v134 = {
    accent = v104.home:label("Welcome to \a[lb]luminaria\n", function(v105)
        return {
            color = v105:color_picker("accent color", color(157, 168, 214))
        };
    end), 
    [1] = v104.home:label("User : \a[lb]" .. v11.user .. "\n"), 
    [2] = v104.home:label("Version : \a[lb]" .. v11.version .. "\n"), 
    [3] = v104.home:label("Report bugs \a[lb]" .. "\n"), 
    bags = v104.home:button("\a[lb]\f<discord> \ndiscord server ", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/7thnG4eagr");
    end, true), 
    mode = v104.home:list("", {
        [1] = "config", 
        [2] = "addons"
    }), 
    config = {
        mode = v104.config:combo("", {
            [1] = "local", 
            [2] = "global"
        }), 
        configlist = v104.config:list("", {
            [1] = "test"
        }), 
        configname = v104.config:input("")
    }, 
    addons = {
        list = v104.addons:listable("", {
            [1] = "antiaim", 
            [2] = "helpers\a[lb] [BETA]", 
            [3] = "visuals", 
            [4] = "misc"
        })
    }, 
    antiaim = {
        buildertype = v104.antiaim:list("", {
            [1] = "neverlose", 
            [2] = "luminaria"
        }), 
        manuals = v104.antiaim:combo("Manuals", {
            [1] = "none", 
            [2] = "freestand", 
            [3] = "forward", 
            [4] = "left", 
            [5] = "right"
        }, function(v106, _)
            return {
                static = v106:switch("Static on Manuals", false)
            };
        end), 
        target = v104.antiaim:combo("Base", {
            [1] = "at target", 
            [2] = "local view"
        }, function(v108)
            return {
                backstab = v108:switch("Avoid Backstab"), 
                safe = v108:selectable("Safehead", {
                    [1] = "knife in air", 
                    [2] = "knife in air+c", 
                    [3] = "zeus in air+c", 
                    [4] = "allow defensive"
                })
            };
        end), 
        flicker = v104.antiaim:switch("Flick Exploit", false, function(v109)
            -- upvalues: v103 (ref)
            return {
                states = v109:selectable("states", v103.conditions)
            }, true;
        end), 
        select = v104.stealer:combo("\n", v103.conditions), 
        stealselect = v104.stealer:combo("\n", {
            [1] = "stand", 
            [2] = "move", 
            [3] = "duck", 
            [4] = "air", 
            [5] = "air+c"
        }), 
        leater1 = v104.stealer:button("                  \v\r Anti-aim Stealer              ", function()

        end, true), 
        leater2 = v104.stealer:button("                  \v\r Anti-aim Stealer              ", function()

        end, false), 
        fakelagenable = v104.fakelag:switch("Enable", false, function(v110)
            return {
                types = v110:combo("Fakelag Type", {
                    [1] = "neverlose", 
                    [2] = "custom"
                })
            }, true;
        end), 
        fakelagticks = v104.fakelag:slider("Ticks", 1, 16, 1, 1, "t"), 
        stealer = {
            plist = v104.plist:list("\n", {
                [1] = "Empty"
            }), 
            steal = v104.plist:button("                             \vSteal                            ", function()

            end, true), 
            refresh = v104.plist:button("    \f<rotate-right>    ", function()

            end, false), 
            progress = v104.plist:label("Progress: "), 
            confirm = v104.plist:button("\a00FF00FF \f<circle-check>", function()

            end, true), 
            cancel = v104.plist:button("\aFF0000FF \f<circle-xmark>", function()

            end, true), 
            result = v104.plist:label("Result: "), 
            error = v104.plist:label("Error: ")
        }
    }, 
    helpers = {
        smartbody = v104.helpers:switch("Smart Baim"), 
        smartjump = v104.helpers:switch("Smart Jumpscout", false, function(v111)
            return {
                options = v111:selectable("\n", {
                    [1] = "adaptive hitchance", 
                    [2] = "limit distance", 
                    [3] = "limit velocity"
                }), 
                distance = v111:slider("distance", 60, 1300, 0, 1, function(v112)
                    return v112 .. "u";
                end), 
                velocity = v111:slider("velocity", 20, 330, 0, 1, function(v113)
                    return v113 .. "u";
                end)
            }, true;
        end), 
        fixrevo = v104.helpers:switch("R8 Fix", false), 
        smartsafe = v104.helpers2:switch("Adaptive Safepoints", false, function(v114)
            return {
                options = v114:selectable("\n", {
                    [1] = "lethal", 
                    [2] = "height advantage", 
                    [3] = "onshot", 
                    [4] = "holding nade"
                }), 
                mode = v114:combo("\n\n", {
                    [1] = "prefer", 
                    [2] = "force"
                })
            }, true;
        end), 
        customzeus = v104.helpers2:switch("Zeusbot Helper"), 
        indicators = v104.helpers2:switch("Helper Status Indicators", false, function(v115)
            return {
                options = v115:selectable("\n", {
                    [1] = "baim", 
                    [2] = "safe", 
                    [3] = "zeus", 
                    [4] = "revo", 
                    [5] = "jumpscout hitchance"
                }), 
                on_peek = v115:switch("only on peek")
            }, true;
        end)
    }, 
    visuals = {
        solus = v104.screen:switch("Solus UI", false, function(v116)
            return {
                color = v116:color_picker("color", color(157, 168, 214))
            }, true;
        end), 
        indicators = v104.screen:switch("Indicators", false, function(v117)
            return {
                items = v117:selectable("", {
                    [1] = "doubletap", 
                    [2] = "hideshots", 
                    [3] = "damage", 
                    [4] = "freestand", 
                    [5] = "fakeduck", 
                    [6] = "baim", 
                    [7] = "safepoint"
                }), 
                color = v117:color_picker("color", color(148, 155, 255))
            }, true;
        end), 
        warnings = v104.screen:switch("Warnings", false, function(v118)
            return {
                types = v118:selectable("", {
                    [1] = "velocity", 
                    [2] = "defensive"
                }), 
                color = v118:color_picker("color", color(255))
            }, true;
        end), 
        damage_indicator = v104.screen:switch("Damage Indicator", false, function(v119)
            return {
                font = v119:combo("font", {
                    [1] = "pixel", 
                    [2] = "clean"
                }), 
                mods = v119:combo("visibility", {
                    [1] = "always", 
                    [2] = "transparent when off", 
                    [3] = "override only"
                }), 
                lerp = v119:switch("animated")
            }, true;
        end), 
        hitmarker = v104.screen:switch("Hit Marker", false, function(v120)
            return {
                color = v120:color_picker("color", color(255, 255, 255))
            }, true;
        end), 
        aspect = v104.screen:switch("Aspect Ratio", false, function(v121)
            return {
                amount = v121:slider("amount", 0, 200, 0, 0.01, function(v122)
                    if v122 == 138 then
                        return "69:50";
                    elseif v122 == 133 then
                        return "4:3";
                    elseif v122 == 125 then
                        return "5:4";
                    elseif v122 == 178 then
                        return "16:9";
                    else
                        return;
                    end;
                end), 
                r1 = v121:button("       16:9        ", function()

                end, true), 
                r2 = v121:button("        5:4        ", function()

                end, true), 
                r3 = v121:button("        4:3        ", function()

                end, true)
            }, true;
        end), 
        panel = v104.screen:switch("Info Panel", false, function(v123)
            return {
                color = v123:color_picker("color", color(157, 168, 214))
            }, true;
        end), 
        viewmodel = v104.screen:switch("Override Viewmodel", false, function(v124)
            return {
                fov = v124:slider("fov: ", 0, 100, 60), 
                x = v124:slider("x: ", -150, 150, 1, 0.1), 
                y = v124:slider("y: ", -150, 150, 1, 0.1), 
                z = v124:slider("z: ", -150, 150, -15, 0.1)
            }, true;
        end), 
        indicators_xyini = v104.screen:switch("\aA3D41FFF500$  \aDEFAULTIndicator", false, function(v125)
            return {
                types = v125:selectable("\n", {
                    [1] = "doubletap", 
                    [2] = "hideshots", 
                    [3] = "dormant aimbot", 
                    [4] = "fake ping", 
                    [5] = "minimum damage", 
                    [6] = "fake duck", 
                    [7] = "force baim", 
                    [8] = "freestanding"
                })
            }, true;
        end), 
        customs = v104.screen:switch("Custom Ui", false, function(v126)
            return {
                color = v126:color_picker("color", color(157, 168, 214, 255))
            }, true;
        end)
    }, 
    misc = {
        ladder = v104.misc:switch("Fast Ladder", false, function(_)
            return {}, true;
        end), 
        animation = v104.misc:switch("Animation Breaker", false, function(v128)
            return {
                ground = v128:combo("ground", {
                    [1] = "\n", 
                    [2] = "skeet", 
                    [3] = "jitter", 
                    [4] = "moonwalk"
                }), 
                air = v128:combo("air", {
                    [1] = "\n", 
                    [2] = "static", 
                    [3] = "autistic"
                }), 
                slide = v128:selectable("slide on:", {
                    [1] = "run", 
                    [2] = "walk", 
                    [3] = "crouch"
                }), 
                lean = v128:slider("move lean", 0, 100, 0, 1, "%")
            }, true;
        end), 
        logs = v104.misc:switch("Aimbot Logs", false, function(v129)
            return {
                types = v129:selectable("type", {
                    [1] = "on screen", 
                    [2] = "console", 
                    [3] = "top left"
                }), 
                screen = v129:combo("screen style", {
                    [1] = "alternative"
                }), 
                color = v129:color_picker("\n", color(157, 168, 214)), 
                notify = v129:button("                   push notification                  ", function()

                end, true)
            }, true;
        end), 
        clantag = v104.misc:switch("Clantag", false), 
        walls = v104.misc:switch("Avoid Walls", false, function(v130)
            return {
                distance = v130:slider("distance", 2, 25, 0, 1)
            }, true;
        end), 
        nadefix = v104.misc:switch("Nade Fix", false), 
        trashtalk = v104.misc:switch("Trashtalk", false, function(v131)
            return {
                types = v131:combo("type", {
                    [1] = "killsay"
                })
            }, true;
        end), 
        model = v104.misc:switch("Model Transparency", false, function(v132)
            return {
                types = v132:selectable("types", {
                    [1] = "on Nade", 
                    [2] = "scoped"
                }), 
                nade = v132:slider("nading", 0, 255, 155, 1, "%"), 
                scope = v132:slider("scoped", 0, 255, 155, 1, "%")
            }, true;
        end), 
        unluck_pingspike = v104.misc:switch("Ping Spike", false, function(v133)
            return {
                amount = v133:slider("\n", 0, 1000, 150, 1, "ms"), 
                warning = v133:label(" \r values above 200 may cause issues \affff00ff\f<triangle-exclamation>\r")
            }, true;
        end)
    }, 
    hidden = {
        solus_x = v104.home:slider("solus x", 0, render.screen_size().x, 400), 
        solus_y = v104.home:slider("solus y", 0, render.screen_size().y, 400), 
        panel_x = v104.home:slider("panel x", 0, render.screen_size().x, 0), 
        panel_y = v104.home:slider("panel y", 0, render.screen_size().y, render.screen_size().y / 2 - 21), 
        dmg_x = v104.home:slider("dmg x", 0, render.screen_size().x, render.screen_size().x / 2 + 2), 
        dmg_y = v104.home:slider("dmg y", 0, render.screen_size().y, render.screen_size().y / 2 - 12)
    }, 
    builder = {}
};
local v149 = {
    prev_disabled = false, 
    refresh = function(v135)
        -- upvalues: v134 (ref), v104 (ref)
        local v136 = v134.addons.list:get(1);
        local _ = v134.addons.list:get(2);
        local v138 = v134.addons.list:get(3);
        local v139 = v134.addons.list:get(4);
        v104.antiaim:visibility(v136);
        v104.builder:visibility(v136);
        v104.fakelag:visibility(v136);
        v104.stealer:visibility(v136);
        v104.screen:visibility(v138);
        v104.misc:visibility(v139);
        v104.screen:visibility(v138);
        v104.misc:visibility(v139);
        if v136 then
            v104.antiaim:visibility(not v135.prev_disabled);
            v104.builder:visibility(not v135.prev_disabled);
            v104.fakelag:visibility(not v135.prev_disabled);
            v104.plist:visibility(v135.prev_disabled);
        end;
    end, 
    hide_antiaim = function(v140)
        -- upvalues: v104 (ref)
        v104.antiaim:visibility(false);
        v104.builder:visibility(false);
        v104.fakelag:visibility(false);
        v104.plist:visibility(true);
        v140.prev_disabled = true;
    end, 
    show_antiaim = function(v141)
        -- upvalues: v104 (ref)
        v104.antiaim:visibility(true);
        v104.builder:visibility(true);
        v104.fakelag:visibility(true);
        v104.plist:visibility(false);
        v141.prev_disabled = false;
    end, 
    update_plist = function(_)
        -- upvalues: v134 (ref)
        local v143 = entity.get_players(true, true);
        local l_plist_0 = v134.antiaim.stealer.plist;
        if not v143 or v143 == {} then
            l_plist_0:reset();
            return;
        else
            local v145 = {};
            local v146 = false;
            for _, v148 in pairs(v143) do
                v146 = true;
                table.insert(v145, v148:get_name());
            end;
            if v146 then
                l_plist_0:update(v145);
            else
                l_plist_0:reset();
            end;
            return;
        end;
    end
};
local v178 = {
    refresh = function(_)
        -- upvalues: v134 (ref), v16 (ref), v149 (ref)
        local v151 = v134.config.configname:get();
        v16:check();
        local v152 = json.parse(files.read(v16.path));
        local v153 = {};
        for v154, _ in pairs(v152) do
            table.insert(v153, v154);
        end;
        table.sort(v153);
        v134.config.configlist:update(v153);
        v134.config.configname:set(v151);
        v149:refresh();
    end, 
    export = function(_)
        -- upvalues: l_base64_0 (ref), l_pui_0 (ref), l_clipboard_0 (ref), v149 (ref)
        local v157 = l_base64_0.encode(json.stringify(l_pui_0.save()));
        l_clipboard_0.set(v157);
        v149:refresh();
    end, 
    import = function(_)
        -- upvalues: l_base64_0 (ref), l_clipboard_0 (ref), v10 (ref), v134 (ref), l_pui_0 (ref), v149 (ref)
        local l_status_0, _ = pcall(l_base64_0.decode, l_clipboard_0.get());
        if not l_status_0 then
            v10("Invalid config");
            return;
        else
            local v161 = json.parse(l_base64_0.decode(l_clipboard_0.get()));
            local v162 = v134.config.configlist:get();
            l_pui_0.load(v161);
            v10("Config Imported");
            v134.config.configlist:set(v162);
            v149:refresh();
            return;
        end;
    end, 
    save = function(v163)
        -- upvalues: v134 (ref), v10 (ref), v16 (ref), l_base64_0 (ref), l_pui_0 (ref), v149 (ref)
        local v164 = v134.config.configname:get();
        if not v164 or v164 == "" or v164 == " " then
            v10("Invalid config name");
            return;
        elseif v164 == "default" then
            v10("Can't override default config");
            return;
        else
            local v165 = "non";
            local v166 = json.parse(files.read(v16.path));
            local v167 = l_base64_0.encode(json.stringify(l_pui_0.save()));
            v165 = v166[v164] ~= nil and "save" or "create";
            v166[v164] = v167;
            files.write(v16.path, json.stringify(v166));
            v10("Config '" .. v164 .. "' saved");
            v163.refresh();
            v149:refresh();
            return;
        end;
    end, 
    load = function(v168)
        -- upvalues: v134 (ref), v10 (ref), v16 (ref), l_base64_0 (ref), l_pui_0 (ref), v149 (ref)
        local v169 = v134.config.configlist:get();
        local v170 = v134.config.configname:get();
        if not v170 or v170 == "" or v170 == " " then
            v10("Invalid config name");
            return;
        else
            local v171 = json.parse(files.read(v16.path))[v170];
            if not v171 then
                v10("Can't find config.. Did you refresh?");
                return;
            else
                local v172 = json.parse(l_base64_0.decode(v171));
                l_pui_0.load(v172);
                v134.config.configlist:set(v169);
                v168.refresh();
                v10("Config '" .. v170 .. "' loaded");
                v149:refresh();
                return;
            end;
        end;
    end, 
    delete_confirm = function(v173)
        -- upvalues: v134 (ref), v10 (ref), v16 (ref), v18 (ref), v149 (ref)
        local v174 = v134.config.configname:get();
        if not v174 or v174 == "" or v174 == " " then
            v10("Invalid config name");
            return;
        else
            local v175 = json.parse(files.read(v16.path));
            v175[v174] = nil;
            files.write(v16.path, json.stringify(v175));
            v173.refresh();
            v10("Config deleted succesfully");
            v134.config.delete2:visibility(false);
            utils.execute_after(0.35 / v18.speed:get(), function()
                -- upvalues: v134 (ref)
                v134.config.delete:visibility(true);
            end);
            v149:refresh();
            return;
        end;
    end, 
    delete = function(_)
        -- upvalues: v134 (ref), v10 (ref), v18 (ref), v149 (ref)
        local v177 = v134.config.configname:get();
        if not v177 or v177 == "" or v177 == " " then
            v10("Invalid config name");
            return;
        else
            v134.config.delete:visibility(false);
            utils.execute_after(0.35 / v18.speed:get(), function()
                -- upvalues: v134 (ref)
                v134.config.delete2:visibility(true);
            end);
            v149:refresh();
            return;
        end;
    end
};
local v216 = {
    created = false, 
    antiaim = v134.addons.list:get(1), 
    helpers = v134.addons.list:get(2), 
    visuals = v134.addons.list:get(3), 
    misc = v134.addons.list:get(4), 
    update_addons = function(v179)
        -- upvalues: v134 (ref)
        v179.antiaim = v134.addons.list:get(1);
        v179.helpers = v134.addons.list:get(2);
        v179.visuals = v134.addons.list:get(3);
        v179.misc = v134.addons.list:get(4);
    end, 
    setup = function(v180)
        -- upvalues: v103 (ref), v134 (ref), v104 (ref), v178 (ref)
        for v181, v182 in pairs(v103.conditions) do
            v134.builder[v181] = {};
            v134.builder[v181].custom = {};
            v134.builder[v181].custom.override = v104.builder:switch("\v " .. v182 .. "\r \194\183 override");
            v134.builder[v181].custom.pitch = v104.builder:combo("\v " .. v182 .. "\r \194\183 pitch", {
                [1] = "off", 
                [2] = "down", 
                [3] = "up", 
                [4] = "0"
            });
            v134.builder[v181].custom.yaw = v104.builder:combo("\v " .. v182 .. "\r \194\183 yaw", {
                [1] = "forward", 
                [2] = "backward", 
                [3] = "left", 
                [4] = "right"
            }, function(v183)
                return {
                    offset = v183:slider("offset", -180, 180, 0, 1, "\194\176")
                };
            end);
            v134.builder[v181].custom.modifier = v104.builder:combo("\v " .. v182 .. "\r \194\183 modifier", {
                [1] = "none", 
                [2] = "center", 
                [3] = "spin", 
                [4] = "left / right"
            }, function(v184)
                return {
                    angle = v184:slider("angle", -180, 180, 0, 1, "\194\176"), 
                    left = v184:slider("left", 0, 180, 0, 1, "\194\176"), 
                    right = v184:slider("right", 0, 180, 0, 1, "\194\176"), 
                    delay = v184:slider("delay", 1, 32, 1, 1, "t"), 
                    offset = v184:slider("offset", -180, 180, 0, 1, "\194\176")
                };
            end);
            v134.builder[v181].custom.desync = v104.builder:switch("\v " .. v182 .. "\r \194\183 desync", false, function(v185)
                return {
                    inverter = v185:switch("inverter", false), 
                    left = v185:slider("left", 0, 60, 0, 1, "\194\176"), 
                    right = v185:slider("right", 0, 60, 0, 1, "\194\176"), 
                    mods = v185:selectable("mods", {
                        [1] = "Jitter", 
                        [2] = "Anti Bruteforce"
                    })
                }, true;
            end);
            v134.builder[v181].default = {};
            v134.builder[v181].default.override = v104.builder:switch("\v " .. v182 .. "\r \194\183 override");
            v134.builder[v181].default.pitch = v104.builder:combo("\v " .. v182 .. "\r \194\183 pitch", {
                [1] = "off", 
                [2] = "down"
            });
            v134.builder[v181].default.yaw = v104.builder:combo("\v " .. v182 .. "\r \194\183 yaw", {
                [1] = "backward", 
                [2] = "left / right", 
                [3] = "meta", 
                [4] = "3way"
            }, function(v186)
                return {
                    offset = v186:slider("offset", -180, 180, 0, 1, "\194\176"), 
                    left = v186:slider("left", -180, 180, 0, 1, "\194\176"), 
                    right = v186:slider("right", -180, 180, 0, 1, "\194\176"), 
                    randoml = v186:slider("random left", -60, 60, 0, 1, "\194\176"), 
                    randomr = v186:slider("random right", -60, 60, 0, 1, "\194\176"), 
                    delay = v186:slider("delay", 0, 14, 0, 1, "t")
                };
            end);
            v134.builder[v181].default.modifier = v104.builder:combo("\v " .. v182 .. "\r \194\183 modifier", {
                [1] = "none", 
                [2] = "center", 
                [3] = "offset"
            }, function(v187)
                return {
                    offset = v187:slider("offset", -180, 180, 0, 1, "\194\176")
                };
            end);
            v134.builder[v181].default.desync = v104.builder:switch("\v " .. v182 .. "\r \194\183 desync", false, function(v188)
                return {
                    inverter = v188:switch("inverter", false), 
                    left = v188:slider("left", 0, 60, 60, 1, "\194\176"), 
                    right = v188:slider("right", 0, 60, 60, 1, "\194\176"), 
                    mods = v188:selectable("options", {
                        [1] = "avoid overlap", 
                        [2] = "jitter", 
                        [3] = "randomize jitter", 
                        [4] = "anti bruteforce"
                    }), 
                    fs = v188:combo("freestanding", {
                        [1] = "off", 
                        [2] = "peek fake", 
                        [3] = "peek real"
                    })
                };
            end);
            v134.builder[v181].default.defensive = v104.builder:combo("\v " .. v182 .. "\r \194\183 defensive", {
                [1] = "off", 
                [2] = "force", 
                [3] = "on peek", 
                [4] = "antiaim"
            }, function(v189)
                return {
                    pitch = v189:combo("pitch", {
                        [1] = "off", 
                        [2] = "custom", 
                        [3] = "jitter", 
                        [4] = "sway", 
                        [5] = "switch", 
                        [6] = "clock", 
                        [7] = "random"
                    }), 
                    pitchoffset = v189:slider("offset", -89, 89, 0, 1, "\194\176"), 
                    pitchoffset2 = v189:slider("offset II.", -89, 89, 0, 1, "\194\176"), 
                    pitchtime = v189:slider("time", 1, 64, 20, 1), 
                    yaw = v189:combo("yaw", {
                        [1] = "off", 
                        [2] = "custom", 
                        [3] = "jitter", 
                        [4] = "spin", 
                        [5] = "random"
                    }), 
                    sync = v189:combo("jitter mode", {
                        [1] = "independent", 
                        [2] = "sync with builder"
                    }), 
                    offset = v189:slider("offset", -180, 180, 0, 1, "\194\176"), 
                    range = v189:slider("range", -180, 180, 0, 1, "\194\176"), 
                    delay = v189:slider("delay", -1, 24, -1, 1, function(v190)
                        if v190 == -1 then
                            return "off";
                        elseif v190 == 0 then
                            return "cycle";
                        else
                            return v190 .. "t";
                        end;
                    end)
                };
            end);
        end;
        v134.config.mode:disabled(true);
        v134.config.mode:set("local");
        v178:refresh();
        v180.created = true;
    end, 
    antiaim_visibility = function(v191)
        -- upvalues: v134 (ref), v103 (ref), v104 (ref), v11 (ref), v10 (ref)
        local _ = v134.addons.list:get(1);
        local v193 = v134.addons.list:get(2);
        local _ = v134.addons.list:get(3);
        local _ = v134.addons.list:get(4);
        local v196 = v134.mode:get() == 2;
        local v197 = v134.antiaim.buildertype:get() == 1;
        local v198 = v134.antiaim.buildertype:get() == 2;
        local v199 = v134.antiaim.select:get();
        for _, v201 in pairs(v134.hidden) do
            v201:visibility(false);
        end;
        for v202, v203 in pairs(v103.conditions) do
            if not v134.builder[v202] then
                return;
            else
                local v204 = v203 == v199;
                local v205 = v134.builder[v202].custom.override:get();
                local l_custom_0 = v134.builder[v202].custom;
                v134.builder[1].custom.override:set(true);
                v134.builder[1].custom.override:visibility(false);
                l_custom_0.override:visibility(v198 and v204);
                l_custom_0.pitch:visibility(v198 and v204 and v205);
                l_custom_0.yaw:visibility(v198 and v204 and v205);
                l_custom_0.modifier:visibility(v198 and v204 and v205);
                l_custom_0.modifier.offset:visibility(l_custom_0.modifier:get() == "center");
                l_custom_0.modifier.angle:visibility(l_custom_0.modifier:get() == "spin");
                l_custom_0.modifier.left:visibility(l_custom_0.modifier:get() == "left / right");
                l_custom_0.modifier.right:visibility(l_custom_0.modifier:get() == "left / right");
                l_custom_0.modifier.delay:visibility(l_custom_0.modifier:get() == "left / right" or l_custom_0.modifier:get() == "center");
                l_custom_0.desync:visibility(v198 and v204 and v205);
                v205 = v134.builder[v202].default.override:get();
                local l_default_0 = v134.builder[v202].default;
                v134.builder[1].default.override:set(true);
                v134.builder[1].default.override:visibility(false);
                l_default_0.override:visibility(v197 and v204);
                l_default_0.pitch:visibility(v197 and v204 and v205);
                l_default_0.yaw:visibility(v197 and v204 and v205);
                l_default_0.yaw.offset:visibility(l_default_0.yaw:get() == "backward" or l_default_0.yaw:get() == "3way");
                l_default_0.yaw.left:visibility(l_default_0.yaw:get() == "left / right" or l_default_0.yaw:get() == "meta");
                l_default_0.yaw.right:visibility(l_default_0.yaw:get() == "left / right" or l_default_0.yaw:get() == "meta");
                l_default_0.yaw.randoml:visibility(l_default_0.yaw:get() == "meta");
                l_default_0.yaw.randomr:visibility(l_default_0.yaw:get() == "meta");
                l_default_0.yaw.delay:visibility(l_default_0.yaw:get() == "left / right" or l_default_0.yaw:get() == "meta");
                l_default_0.modifier:visibility(v197 and v204 and v205);
                l_default_0.desync:visibility(v197 and v204 and v205);
                l_default_0.defensive:visibility(v197 and v204 and v205);
                l_default_0.defensive.pitch:visibility(l_default_0.defensive:get() == "antiaim" or l_default_0.defensive:get() == "on peek");
                l_default_0.defensive.pitchoffset:visibility((not (l_default_0.defensive:get() ~= "antiaim") or l_default_0.defensive:get() == "on peek") and (l_default_0.defensive.pitch:get() == "custom" or not (l_default_0.defensive.pitch:get() ~= "jitter") or not (l_default_0.defensive.pitch:get() ~= "random") or l_default_0.defensive.pitch:get() == "switch"));
                l_default_0.defensive.pitchoffset2:visibility((not (l_default_0.defensive:get() ~= "antiaim") or l_default_0.defensive:get() == "on peek") and (l_default_0.defensive.pitch:get() == "jitter" or not (l_default_0.defensive.pitch:get() ~= "random") or l_default_0.defensive.pitch:get() == "switch"));
                l_default_0.defensive.pitchtime:visibility((not (l_default_0.defensive:get() ~= "antiaim") or l_default_0.defensive:get() == "on peek") and (l_default_0.defensive.pitch:get() == "sway" or l_default_0.defensive.pitch:get() == "clock"));
                l_default_0.defensive.yaw:visibility(l_default_0.defensive:get() == "antiaim" or l_default_0.defensive:get() == "on peek");
                l_default_0.defensive.sync:visibility((not (l_default_0.defensive:get() ~= "antiaim") or l_default_0.defensive:get() == "on peek") and l_default_0.defensive.yaw:get() == "jitter");
                l_default_0.defensive.delay:visibility((not (l_default_0.defensive:get() ~= "antiaim") or l_default_0.defensive:get() == "on peek") and l_default_0.defensive.yaw:get() == "jitter" and l_default_0.defensive.sync:get() == "independent");
                l_default_0.defensive.offset:visibility((not (l_default_0.defensive:get() ~= "antiaim") or l_default_0.defensive:get() == "on peek") and (l_default_0.defensive.yaw:get() == "custom" or not (l_default_0.defensive.yaw:get() ~= "sway") or not (l_default_0.defensive.yaw:get() ~= "spin") or l_default_0.defensive.yaw:get() == "jitter"));
                l_default_0.defensive.range:visibility((not (l_default_0.defensive:get() ~= "antiaim") or l_default_0.defensive:get() == "on peek") and (l_default_0.defensive.yaw:get() == "sway" or l_default_0.defensive.yaw:get() == "jitter"));
            end;
        end;
        v134.addons.list:visibility(v196);
        v104.config:visibility(not v196);
        v134.helpers.smartjump.distance:visibility(v134.helpers.smartjump.options:get("limit distance"));
        v134.helpers.smartjump.velocity:visibility(v134.helpers.smartjump.options:get("limit velocity"));
        v134.misc.unluck_pingspike.warning:visibility(v134.misc.unluck_pingspike.amount:get() > 200);
        v134.misc.logs.screen:visibility(v134.misc.logs.types:get("on screen"));
        v134.misc.logs.color:visibility(v134.misc.logs.types:get("on screen") or v134.misc.logs.types:get("console") or v134.misc.logs.types:get("top left"));
        v134.misc.logs.notify:visibility(v134.misc.logs.types:get("on screen") or v134.misc.logs.types:get("console") or v134.misc.logs.types:get("top left"));
        v134.misc.model.nade:visibility(v134.misc.model.types:get("On Nade"));
        v134.misc.model.scope:visibility(v134.misc.model.types:get("Scoped"));
        v134.visuals.customs:visibility(false);
        for _, v209 in pairs(v134.helpers) do
            v209:visibility(v193);
        end;
        if v11.version == "basic" then
            v134.antiaim.buildertype:disabled(true);
            v134.antiaim.leater1:disabled(true);
            v134.antiaim.leater2:visibility(false);
            v134.antiaim.leater1:visibility(true);
            v134.antiaim.select:visibility(true);
            v134.antiaim.stealselect:visibility(false);
            for _, v211 in pairs(v134.antiaim.stealer) do
                v211:visibility(false);
            end;
            for _, v213 in pairs(v134.helpers) do
                if v213:get() then
                    v10("Helpers only available in Beta");
                    break;
                end;
            end;
            for _, v215 in pairs(v134.helpers) do
                v215:disabled(true);
                v215:set(false);
            end;
            if v134.antiaim.buildertype:get() == 2 then
                v10("Viewangles only available in Beta");
                v134.antiaim.buildertype:set(1);
            end;
        elseif v11.version == "beta" then
            v134.antiaim.leater1:disabled(true);
        end;
        v191.antiaim = v134.addons.list:get(1);
        v191.helpers = v134.addons.list:get(2);
        v191.visuals = v134.addons.list:get(3);
        v191.misc = v134.addons.list:get(4);
    end
};
local v225 = {
    disableladder = {
        [1] = "CHEGrenade", 
        [2] = "CMolotovGrenade", 
        [3] = "CSmokeGrenade", 
        [4] = "CDecoyGrenade", 
        [5] = "CIncendiaryGrenade", 
        [6] = "CFlashbang"
    }, 
    aspectratio = function()
        -- upvalues: v134 (ref)
        if not v134.visuals.aspect:get() then
            cvar.r_aspectratio:float(0);
            return;
        else
            cvar.r_aspectratio:float(v134.visuals.aspect.amount:get() / 100);
            return;
        end;
    end, 
    viewmodel = function()
        -- upvalues: v134 (ref)
        if not v134.visuals.viewmodel:get() then
            cvar.viewmodel_fov:float(60);
            cvar.viewmodel_offset_x:float(1);
            cvar.viewmodel_offset_y:float(1);
            cvar.viewmodel_offset_z:float(-1.5);
            return;
        else
            cvar.sv_competitive_minspec:int(0);
            cvar.viewmodel_fov:float(v134.visuals.viewmodel.fov:get());
            cvar.viewmodel_offset_x:float(v134.visuals.viewmodel.x:get() / 10);
            cvar.viewmodel_offset_y:float(v134.visuals.viewmodel.y:get() / 10);
            cvar.viewmodel_offset_z:float(v134.visuals.viewmodel.z:get() / 10);
            return;
        end;
    end, 
    ladder = function(v217, v218)
        -- upvalues: v134 (ref)
        if not v134.misc.ladder:get() then
            return;
        else
            local v219 = entity.get_local_player();
            if not v219 or not v219:is_alive() then
                return;
            elseif v219.m_MoveType ~= 9 then
                return;
            else
                local v220 = render.camera_angles();
                local _ = math.abs(0);
                local v222 = v219:get_player_weapon();
                local v223 = false;
                if v222 then
                    for v224 = 1, #v217.disableladder do
                        if v219:get_classname(v222) == v217.disableladder[v224] then
                            v223 = true;
                            break;
                        end;
                    end;
                end;
                if v218.forwardmove > 0 and not v223 then
                    if v220.x < 45 then
                        v218.view_angles.x = 89;
                        v218.in_moveright = true;
                        v218.in_moveleft = false;
                        v218.in_forward = false;
                        v218.in_back = true;
                        if v218.sidemove == 0 then
                            v218.view_angles.y = v218.view_angles.y + 90;
                        elseif v218.sidemove < 0 then
                            v218.view_angles.y = v218.view_angles.y + 150;
                        elseif v218.sidemove > 0 then
                            v218.view_angles.y = v218.view_angles.y + 30;
                        end;
                    end;
                elseif v218.forwardmove < 0 and not v223 then
                    v218.view_angles.x = 89;
                    v218.in_moveright = false;
                    v218.in_moveleft = true;
                    v218.in_forward = true;
                    v218.in_back = false;
                    if v218.sidemove == 0 then
                        v218.view_angles.y = v218.view_angles.y + 90;
                    elseif v218.sidemove > 0 then
                        v218.view_angles.y = v218.view_angles.y + 150;
                    elseif v218.sidemove < 0 then
                        v218.view_angles.y = v218.view_angles.y + 30;
                    end;
                end;
                return;
            end;
        end;
    end, 
    unluck_pingspike = function()
        -- upvalues: v134 (ref), v18 (ref)
        if v134.misc.unluck_pingspike:get() then
            cvar.sv_maxunlag:float(1);
            v18.fakeping:override(v134.misc.unluck_pingspike.amount:get());
            v18.fakeping:disabled(true);
        else
            v18.fakeping:override();
            cvar.sv_maxunlag:float(0.2);
            v18.fakeping:disabled(false);
        end;
    end
};
local v283 = {
    temp = false, 
    way3 = 1, 
    speen = 0, 
    delayinvert = false, 
    pitchswitch = false, 
    yawsway = false, 
    pitchsway = false, 
    spinval = 0, 
    shot_choke = 0, 
    olddefensive = false, 
    olddt = false, 
    Angles = {
        Yaw = 0, 
        Desync = 0, 
        Pitch = 0
    }, 
    Data = {
        DesyncSide = false, 
        SwitchLR = false, 
        NextSwitch = 0, 
        FakelagAmount = 0, 
        Sidemove = 1.1, 
        DesyncJitterSide = false, 
        DesyncJitter = 0
    }, 
    BackupData = {
        Yaw = 0, 
        Desync = 0, 
        AddedYaw = 0
    }, 
    setAngle = function(v226, v227, v228)
        if v227 == false then
            v226.view_angles.y = v228;
        else
            v226.view_angles.x = v228;
        end;
    end, 
    calculateFakelag = function(v229, v230)
        -- upvalues: v134 (ref), v18 (ref)
        v229.Data.FakelagAmount = v230.desync:get() == true and 1 or 0;
        if v134.antiaim.fakelagenable:get() then
            if v134.antiaim.fakelagenable.types:get() == "neverlose" or v134.antiaim.fakelagenable.types:get_override() == "neverlose" then
                v18.fakelaglimit:override(v134.antiaim.fakelagticks:get());
                v18.fakelagenable:override(true);
            else
                v229.Data.FakelagAmount = v134.antiaim.fakelagticks:get();
                v18.fakelagenable:override(false);
            end;
        else
            v18.fakelagenable:override(false);
        end;
    end, 
    applyFakelag = function(v231, v232)
        -- upvalues: v134 (ref)
        if v134.antiaim.fakelagenable.types:get() == "custom" or v134.antiaim.fakelagenable.types:get_override() == "custom" then
            if v232.choked_commands ~= v231.Data.FakelagAmount then
                cvar.sv_maxusrcmdprocessticks:int(16);
                v232.send_packet = false;
            end;
            if v231.shot_choke > 0 then
                v231.shot_choke = v231.shot_choke - 1;
                v232.send_packet = true;
            end;
        end;
    end, 
    calculatePitch = function(v233, v234, v235)
        -- upvalues: v103 (ref)
        if v235.pitch:get() == "off" then
            v233.Angles.Pitch = v234.view_angles.x;
            return;
        elseif v235.pitch:get() == "custom" then
            v233.Angles.Pitch = v235.Pitch.Angle:get();
            return;
        else
            v233.Angles.Pitch = v103.anglespitch[v235.pitch:get()];
            return;
        end;
    end, 
    calculateYawBase = function(v236, v237, v238)
        -- upvalues: v134 (ref), v103 (ref)
        local l_y_0 = v237.view_angles.y;
        local v240 = v134.antiaim.target:get() == "at target";
        if v134.antiaim.manuals:get() == "none" or v134.antiaim.manuals:get() == "freestand" then
            if v240 and entity.get_threat() then
                if v134.antiaim.manuals:get() ~= "freestand" then
                    l_y_0 = l_y_0 + v103:calculateattarget(v237.view_angles) + v103.anglesyaw[v238.yaw:get()] + v238.yaw.offset:get();
                    v236.BackupData.AddedYaw = v103:calculateattarget(v237.view_angles) + v103.anglesyaw[v238.yaw:get()] + v238.yaw.offset:get();
                elseif rage.antiaim:get_target(true) ~= nil and v134.antiaim.manuals:get() == "freestand" then
                    l_y_0 = rage.antiaim:get_target(true);
                    v236.BackupData.AddedYaw = rage.antiaim:get_target(true);
                else
                    l_y_0 = l_y_0 + v103:calculateattarget(v237.view_angles) + v103.anglesyaw[v238.yaw:get()] + v238.yaw.offset:get();
                    v236.BackupData.AddedYaw = v103:calculateattarget(v237.view_angles) + v103.anglesyaw[v238.yaw:get()] + v238.yaw.offset:get();
                end;
            else
                l_y_0 = l_y_0 + v103.anglesyaw[v238.yaw:get()] + v238.yaw.offset:get();
                v236.BackupData.AddedYaw = v103.anglesyaw[v238.yaw:get()] + v238.yaw.offset:get();
            end;
        else
            l_y_0 = l_y_0 + v103.anglesyaw[v134.antiaim.manuals:get()];
        end;
        v236.Angles.Yaw = l_y_0;
    end, 
    calculateYawModifier = function(v241, _, v243)
        -- upvalues: v134 (ref)
        if v243.modifier:get() == "none" then
            return;
        else
            local v244 = rage.antiaim:get_target(true) ~= nil and v134.antiaim.manuals:get() == "freestand" and v134.antiaim.manuals.static:get();
            if v134.antiaim.manuals:get() ~= "none" and v134.antiaim.manuals:get() ~= "freestand" and v134.antiaim.manuals.static:get() or v244 then
                return;
            elseif v243.modifier:get() == "center" then
                if v241.Data.NextSwitch < globals.client_tick then
                    if v241.Data.SwitchLR == false then
                        v241.Angles.Yaw = v241.Angles.Yaw + v243.modifier.offset:get() / 2;
                        v241.BackupData.Yaw = v241.Angles.Yaw;
                        v241.Data.NextSwitch = globals.client_tick + v243.modifier.delay:get();
                        v241.Data.SwitchLR = true;
                        v241.Data.DesyncSide = false;
                    else
                        v241.Angles.Yaw = v241.Angles.Yaw - v243.modifier.offset:get() / 2;
                        v241.BackupData.Yaw = v241.Angles.Yaw;
                        v241.Data.NextSwitch = globals.client_tick + v243.modifier.delay:get();
                        v241.Data.SwitchLR = false;
                        v241.Data.DesyncSide = true;
                    end;
                end;
                v241.Angles.Yaw = v241.BackupData.Yaw;
                return;
            elseif v243.modifier:get() == "spin" then
                if v241.Data.NextSwitch < globals.client_tick then
                    v241.Angles.Yaw = v241.BackupData.Yaw + v243.modifier.offset:get();
                    v241.BackupData.Yaw = v241.Angles.Yaw;
                    v241.Data.NextSwitch = globals.client_tick + v243.modifier.delay:get();
                    v241.Data.DesyncSide = v243.modifier.offset:get() <= 0;
                end;
                v241.Angles.Yaw = v241.BackupData.Yaw;
                return;
            elseif v243.modifier:get() == "left / right" then
                if v241.Data.NextSwitch < globals.client_tick then
                    if v241.Data.SwitchLR == false then
                        v241.Angles.Yaw = v241.Angles.Yaw + v243.modifier.right:get();
                        v241.BackupData.Yaw = v241.Angles.Yaw;
                        v241.Data.NextSwitch = globals.client_tick + v243.modifier.delay:get();
                        v241.Data.SwitchLR = true;
                        v241.Data.DesyncSide = false;
                    else
                        v241.Angles.Yaw = v241.Angles.Yaw - v243.modifier.left:get();
                        v241.BackupData.Yaw = v241.Angles.Yaw;
                        v241.Data.NextSwitch = globals.client_tick + v243.modifier.delay:get();
                        v241.Data.SwitchLR = false;
                        v241.Data.DesyncSide = true;
                    end;
                end;
                v241.Angles.Yaw = v241.BackupData.Yaw;
                return;
            else
                return;
            end;
        end;
    end, 
    calculateDesync = function(v245, _, v247)
        if not v247.desync:get() then
            return;
        else
            local l_Yaw_0 = v245.Angles.Yaw;
            if v247.desync.mods:get("Jitter") then
                if v247.modifier:get() == "None" or v247.modifier:get() == "Spin" then
                    if v245.Data.DesyncJitter < globals.client_tick then
                        if v245.Data.DesyncJitterSide == false then
                            l_Yaw_0 = l_Yaw_0 - v247.desync.right:get();
                            v245.BackupData.Desync = l_Yaw_0;
                            v245.Data.DesyncJitter = globals.client_tick + 64;
                            v245.Data.DesyncJitterSide = true;
                        else
                            l_Yaw_0 = l_Yaw_0 + v247.desync.left:get();
                            v245.BackupData.Desync = l_Yaw_0;
                            v245.Data.DesyncJitter = globals.client_tick + 64;
                            v245.Data.DesyncJitterSide = false;
                        end;
                    end;
                    v245.Angles.Desync = v245.BackupData.Desync;
                    return;
                else
                    l_Yaw_0 = l_Yaw_0 + (v245.Data.DesyncSide == true and v247.desync.left:get() or -v247.desync.right:get());
                end;
            else
                l_Yaw_0 = l_Yaw_0 + (v247.desync.inverter:get() == true and v247.desync.left:get() or -v247.desync.right:get());
            end;
            v245.Angles.Desync = l_Yaw_0;
            return;
        end;
    end, 
    ApplyAngles = function(v249, v250, v251)
        -- upvalues: v103 (ref)
        if not v103.shouldantiaim(v250) then
            return;
        else
            local v252 = entity.get_local_player();
            local v253 = v103.normalizeyaw(v249.Angles.Yaw);
            local v254 = v103.normalizeyaw(v249.Angles.Desync);
            v249.setAngle(v250, true, v249.Angles.Pitch);
            if v251.desync:get() then
                if v250.choked_commands == 0 then
                    if v103.getvelocity(v252) < 4 then
                        v250.sidemove = v249.Data.Sidemove;
                    end;
                    v249.setAngle(v250, false, v254);
                else
                    v249.setAngle(v250, false, v253);
                    v249.Data.Sidemove = v249.Data.Sidemove * -1;
                end;
                return;
            else
                v249.setAngle(v250, false, v253);
                return;
            end;
        end;
    end, 
    NeverloseAntiaim = function(v255, v256, v257)
        -- upvalues: v18 (ref), v30 (ref), v134 (ref), v59 (ref), v103 (ref)
        local v258 = entity.get_local_player();
        if not v258 then
            return;
        else
            local v259 = v258.m_flPoseParameter[11] * 120 - 60 > 0;
            local _ = rage.antiaim:inverter();
            local v261 = (not not v18.doubletap:get() or v18.hideshots:get()) and not v18.fakeduck:get();
            local _ = v255.olddt ~= v261;
            local v263 = 0;
            local v264 = {};
            local v265 = v258:get_player_weapon();
            if v30:is_active(v258, true, true).tick - globals.tickcount == 1 then
                v255.pitchswitch = not v255.pitchswitch;
            end;
            if v257.pitch:get() == "down" then
                v18.pitch:set("Down");
            else
                v18.pitch:override("Disabled");
            end;
            v18.avoid_backstab:override(v134.antiaim.target.backstab:get());
            v18.attarget:override(v134.antiaim.target:get() == "at target" and "At Target" or "Local View");
            if v257.desync:get() then
                v18.body_yaw:override(true);
                if v257.desync.mods:get("jitter") and v257.yaw.delay:get() == 0 then
                    table.insert(v264, "Jitter");
                end;
                if v257.desync.mods:get("avoid overlap") then
                    table.insert(v264, "Avoid Overlap");
                end;
                if v257.desync.mods:get("randomize jitter") then
                    table.insert(v264, "Randomize Jitter");
                end;
                if v257.desync.mods:get("anti bruteforce") then
                    table.insert(v264, "Anti Bruteforce");
                end;
                v18.left_limit:override(v257.desync.left:get());
                v18.right_limit:override(v257.desync.right:get());
                v18.inverter:override(v257.desync.inverter:get());
            end;
            if v257.yaw:get() == "backward" then
                v18.yaw:set("Backward");
                v263 = v257.yaw.offset:get();
            elseif v257.yaw:get() == "3way" then
                local v266 = v257.yaw.offset:get();
                if globals.choked_commands > 0 then
                    return;
                elseif v261 then
                    v255.way3 = v255.way3 + 1;
                    if v255.way3 > 3 then
                        v255.way3 = 1;
                    end;
                    if v255.way3 == 1 then
                        v263 = -v266 / 2 + 3;
                        rage.antiaim:inverter(false);
                    elseif v255.way3 == 2 then
                        v263 = v266 / 2;
                        rage.antiaim:inverter(true);
                    else
                        v263 = -7;
                        rage.antiaim:inverter(true);
                    end;
                else
                    table.insert(v264, "Jitter");
                    if v259 and v255.temp then
                        v263 = v266 / 2 + 3;
                        v255.temp = false;
                    elseif not v259 and v255.temp then
                        v263 = -v266 / 2;
                    elseif v259 and not v255.temp then
                        v263 = -7;
                        v255.temp = true;
                    elseif v259 and not v255.temp then
                        v263 = -v266 / 2;
                    end;
                end;
            elseif v257.yaw:get() == "left / right" then
                if v257.desync.mods:get("jitter") then
                    if globals.choked_commands == 0 then
                        if globals.tickcount % (v257.yaw.delay:get() + 5) * 2 > v257.yaw.delay:get() + 5 then
                            v255.delayinvert = true;
                        else
                            v255.delayinvert = false;
                        end;
                    end;
                    if v261 then
                        rage.antiaim:inverter(v255.delayinvert);
                        v263 = v255.delayinvert and v257.yaw.left:get() or v257.yaw.right:get();
                    else
                        table.insert(v264, "Jitter");
                        v263 = v259 and v257.yaw.left:get() or v257.yaw.right:get();
                    end;
                elseif globals.choked_commands > 0 then
                    return;
                else
                    if globals.tickcount % (v257.yaw.delay:get() + 5) * 2 > v257.yaw.delay:get() + 5 then
                        v255.delayinvert = true;
                    else
                        v255.delayinvert = false;
                    end;
                    v263 = v255.delayinvert and v257.yaw.left:get() or v257.yaw.right:get();
                end;
            elseif v257.yaw:get() == "meta" then
                if v257.desync.mods:get("jitter") then
                    if globals.choked_commands == 0 then
                        if globals.tickcount % (v257.yaw.delay:get() + 5) * 2 > v257.yaw.delay:get() + 5 then
                            v255.delayinvert = true;
                        else
                            v255.delayinvert = false;
                        end;
                    end;
                    if v261 then
                        rage.antiaim:inverter(v255.delayinvert);
                        v263 = v255.delayinvert and v257.yaw.left:get() + math.random(0, v257.yaw.randoml:get()) or v257.yaw.right:get() + math.random(0, v257.yaw.randomr:get());
                    else
                        table.insert(v264, "Jitter");
                        v263 = v259 and v257.yaw.left:get() + math.random(0, v257.yaw.randoml:get()) or v257.yaw.right:get() + math.random(0, v257.yaw.randomr:get());
                    end;
                elseif globals.choked_commands > 0 then
                    return;
                else
                    if globals.tickcount % (v257.yaw.delay:get() + 5) * 2 > v257.yaw.delay:get() + 5 then
                        v255.delayinvert = true;
                    else
                        v255.delayinvert = false;
                    end;
                    v263 = v255.delayinvert and v257.yaw.left:get() + math.random(0, v257.yaw.randoml:get()) or v257.yaw.right:get() + math.random(0, v257.yaw.randomr:get());
                end;
            end;
            if v257.modifier:get() == "center" then
                if v257.yaw.delay:get() == 0 then
                    v18.yaw:set("Backward");
                    v263 = v263 + (v259 and v257.modifier.offset:get() / 2 or -v257.modifier.offset:get() / 2);
                elseif v257.desync.mods:get("jitter") then
                    if globals.choked_commands > 0 then
                        return;
                    else
                        if globals.tickcount % (v257.yaw.delay:get() + 6) * 2 > v257.yaw.delay:get() + 6 then
                            v255.delayinvert = true;
                        else
                            v255.delayinvert = false;
                        end;
                        rage.antiaim:inverter(v255.delayinvert);
                        if v261 then
                            v263 = v263 + (v255.delayinvert and v257.modifier.offset:get() / 2 or -v257.modifier.offset:get() / 2);
                        else
                            v263 = v263 + (v259 and v257.modifier.offset:get() / 2 or -v257.modifier.offset:get() / 2);
                        end;
                    end;
                elseif globals.choked_commands > 0 then
                    return;
                else
                    v263 = v263 + (v255.delayinvert and v257.modifier.offset:get() / 2 or -v257.modifier.offset:get() / 2);
                end;
            elseif v257.modifier:get() == "offset" then
                if v257.yaw.delay:get() == 0 then
                    v18.yaw:set("Backward");
                    if v259 then
                        local v267 = v257.modifier.offset:get() + v263;
                        if v267 then
                            v263 = v267;
                        end;
                    end;
                elseif v257.desync.mods:get("jitter") then
                    if globals.choked_commands > 0 then
                        return;
                    else
                        if globals.tickcount % (v257.yaw.delay:get() + 6) * 2 > v257.yaw.delay:get() + 6 then
                            v255.delayinvert = true;
                        else
                            v255.delayinvert = false;
                        end;
                        rage.antiaim:inverter(v255.delayinvert);
                        if v261 then
                            if v255.delayinvert then
                                local v268 = v257.modifier.offset:get() + v263;
                                if v268 then
                                    v263 = v268;
                                end;
                            end;
                        elseif v259 then
                            local v269 = v257.modifier.offset:get() + v263;
                            if v269 then
                                v263 = v269;
                            end;
                        end;
                    end;
                elseif globals.choked_commands > 0 then
                    return;
                elseif v255.delayinvert then
                    local v270 = v257.modifier.offset:get() + v263;
                    if v270 then
                        v263 = v270;
                    end;
                end;
            end;
            if v257.defensive:get() == "force" then
                v18.hidden:override(false);
                v18.lag_option:override("Always On");
            elseif v257.defensive:get() == "antiaim" then
                v18.hidden:set(true);
                v18.lag_option:override("Always On");
            else
                v18.hidden:override(false);
                v18.lag_option:override("On Peek");
            end;
            if v257.defensive:get() == "on peek" or v257.defensive:get() == "antiaim" then
                v18.hidden:override(true);
                if v257.defensive.pitch:get() == "custom" then
                    rage.antiaim:override_hidden_pitch(v257.defensive.pitchoffset:get());
                elseif v257.defensive.pitch:get() == "random" then
                    rage.antiaim:override_hidden_pitch(math.random(v257.defensive.pitchoffset:get(), v257.defensive.pitchoffset2:get()));
                elseif v257.defensive.pitch:get() == "jitter" then
                    rage.antiaim:override_hidden_pitch(globals.tickcount % 4 < 2 and v257.defensive.pitchoffset:get() or v257.defensive.pitchoffset2:get());
                elseif v257.defensive.pitch:get() == "switch" then
                    rage.antiaim:override_hidden_pitch(v255.pitchswitch and v257.defensive.pitchoffset:get() or v257.defensive.pitchoffset2:get());
                elseif v257.defensive.pitch:get() == "sway" then
                    local v271 = 0;
                    local v272 = 0;
                    if v257.defensive.pitchoffset:get() > v257.defensive.pitchoffset2:get() then
                        v271 = v257.defensive.pitchoffset:get();
                        v272 = v257.defensive.pitchoffset2:get();
                    elseif v257.defensive.pitchoffset:get() < v257.defensive.pitchoffset2:get() then
                        v271 = v257.defensive.pitchoffset2:get();
                        v272 = v257.defensive.pitchoffset:get();
                    end;
                    local v273 = math.floor(v59.animation:new("pitchsway", v255.pitchsway and 90 or -90, v257.defensive.pitchtime:get()) + 0.5);
                    if v273 > 87 then
                        v255.pitchsway = false;
                    elseif v273 < -87 then
                        v255.pitchsway = true;
                    end;
                    rage.antiaim:override_hidden_pitch(v273);
                elseif v257.defensive.pitch:get() == "clock" then
                    local v274 = math.floor(v59.animation:new("pitchclock", v255.pitchsway and 90 or -90, v257.defensive.pitchtime:get()) + 0.5);
                    if v274 > 87 then
                        v255.pitchsway = false;
                    elseif v274 < -87 then
                        v255.pitchsway = true;
                    end;
                    rage.antiaim:override_hidden_pitch(v274);
                end;
                if v257.defensive.yaw:get() == "custom" then
                    rage.antiaim:override_hidden_yaw_offset(v257.defensive.offset:get() + v263);
                elseif v257.defensive.yaw:get() == "random" then
                    rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                elseif v257.defensive.yaw:get() == "static spin" then
                    rage.antiaim:override_hidden_yaw_offset(v255.spinval + v263);
                elseif v257.defensive.yaw:get() == "spin" then
                    v255.speen = v257.defensive.offset:get() + v255.speen;
                    rage.antiaim:override_hidden_yaw_offset(v255.speen + v263);
                elseif v257.defensive.yaw:get() == "jitter" then
                    local v275 = false;
                    if v257.defensive.sync:get() == "sync with builder" then
                        v275 = v257.yaw.delay:get() > 0 and v255.delayinvert or rage.antiaim:inverter();
                    elseif v257.defensive.delay:get() == -1 then
                        v275 = globals.tickcount % 4 < 2;
                    elseif v257.defensive.delay:get() == 0 then
                        v275 = v255.pitchswitch;
                    else
                        v275 = globals.tickcount % v257.defensive.delay:get() * 2 > v257.defensive.delay:get();
                    end;
                    rage.antiaim:override_hidden_yaw_offset(v263 + v257.defensive.offset:get() + v257.defensive.range:get() * (v275 and -1 or 1));
                end;
            end;
            if v134.antiaim.flicker:get() and v134.antiaim.flicker.states:get(v103.state.state) then
                if not v134.antiaim.flicker.states:get(v103.state.state) then
                    return;
                elseif rage.exploit:get() < 1 then
                    return;
                else
                    rage.antiaim:inverter(false);
                    v18.yaw_yaw:override(5);
                    v18.yaw_modifier:override("Random");
                    v18.yaw_modifier_degree:override(5);
                    v18.body_yaw:override(true);
                    v18.body_options:override("");
                    v18.left_limit:override(42);
                    v18.right_limit:override(42);
                    v18.freestanding:override(false);
                    v18.hidden:override(true);
                    rage.antiaim:override_hidden_pitch(89);
                    rage.antiaim:override_hidden_yaw_offset(-70);
                    rage.antiaim:override_hidden_yaw_offset(-90);
                    v18.hslag:override("Break LC");
                    v18.lag_option:override("Always On");
                    v256.force_defensive = v256.command_number % 7 == 0;
                end;
            end;
            if not v265 then
                return;
            else
                local v276 = v265:get_weapon_info();
                if v134.antiaim.target.safe:get("knife in air") and v103.state.state == 7 and v276.weapon_name == "weapon_knife" then
                    v263 = 0;
                    rage.antiaim:inverter(true);
                    v18.left_limit:override(0);
                    if not v134.antiaim.target.safe:get("allow defensive") then
                        v18.hidden:override(false);
                    end;
                elseif v134.antiaim.target.safe:get("knife in air+c") and v103.state.state == 8 and v276.weapon_name == "weapon_knife" then
                    v263 = 0;
                    rage.antiaim:inverter(true);
                    v18.left_limit:override(0);
                    if not v134.antiaim.target.safe:get("allow defensive") then
                        v18.hidden:override(false);
                    end;
                elseif v134.antiaim.target.safe:get("zeus in air+c") and v103.state.state == 8 and v276.weapon_name == "weapon_taser" then
                    v263 = 0;
                    rage.antiaim:inverter(true);
                    v18.left_limit:override(0);
                    if not v134.antiaim.target.safe:get("allow defensive") then
                        v18.hidden:override(false);
                    end;
                end;
                if v134.antiaim.manuals:get() == "left" then
                    if not v134.antiaim.manuals.static:get() then
                        v263 = v263 - 90;
                    else
                        v263 = -90;
                        rage.antiaim:inverter(false);
                        v18.body_options:override("");
                    end;
                end;
                if v134.antiaim.manuals:get() == "right" then
                    if not v134.antiaim.manuals.static:get() then
                        v263 = v263 + 90;
                    else
                        v263 = 90;
                        rage.antiaim:inverter(false);
                    end;
                    v18.body_options:override("");
                end;
                if v134.antiaim.manuals:get() == "forward" then
                    if not v134.antiaim.manuals.static:get() then
                        v263 = v263 - 180;
                    else
                        v263 = 180;
                        rage.antiaim:inverter(false);
                    end;
                    v18.body_options:override("");
                end;
                if v134.antiaim.manuals:get() == "freestand" then
                    if not v134.antiaim.manuals.static:get() then
                        v18.freestanding:override(true);
                    elseif rage.antiaim:get_target(true) ~= nil then
                        v18.freestanding:override(true);
                        v18.body_options:override("");
                        rage.antiaim:inverter(false);
                    end;
                else
                    v18.freestanding:override(false);
                end;
                v18.body_options:override(v264);
                v18.yaw_yaw:override(v263);
                v255.olddt = v261;
                v255.olddefensive = v30:is_active(v258);
                return;
            end;
        end;
    end, 
    run = function(v277, v278)
        -- upvalues: v134 (ref), v103 (ref), v18 (ref)
        if not v134.addons.list:get(1) then
            return;
        else
            local v279 = 1;
            local l_state_0 = v103.state.state;
            if v134.antiaim.buildertype:get() == 2 and v134.builder[l_state_0].custom.override:get() or v134.antiaim.buildertype:get() == 1 and v134.builder[l_state_0].default.override:get() then
                v279 = l_state_0;
            end;
            local v281 = v134.antiaim.buildertype:get() == 2 and v134.builder[v279].custom or v134.builder[v279].default;
            if v134.antiaim.buildertype:get() == 2 then
                v277:calculateFakelag(v281);
                v277:applyFakelag(v278);
                v277:calculatePitch(v278, v281);
                v277:calculateYawBase(v278, v281);
                v277:calculateYawModifier(v278, v281);
                v277:calculateDesync(v278, v281);
                v277:ApplyAngles(v278, v281);
                v18.enabled:override(false);
                v134.antiaim.fakelagenable.types:override("Custom");
                v134.antiaim.fakelagenable.types:disabled(true);
            else
                v18.enabled:override(true);
                v277:calculateFakelag(v281);
                v277:applyFakelag(v278);
                v277:NeverloseAntiaim(v278, v281);
                v134.antiaim.fakelagenable.types:override();
                v134.antiaim.fakelagenable.types:disabled(false);
            end;
            return;
        end;
    end, 
    reset_builder = function(v282)
        v282.Data.FakelagAmount = 0;
        v282.Data.NextSwitch = 0;
        v282.Data.DesyncJitter = 0;
    end
};
local v284 = {
    [1] = "holding", 
    [2] = "toggled", 
    [3] = "~"
};
local v304 = {
    dt_text = {
        "waiting", 
        color(255, 50, 50, 255)
    }, 
    hs_text = {
        "waiting", 
        color(255, 50, 50, 255)
    }, 
    db = {}, 
    render_indicators = function(v285)
        -- upvalues: v134 (ref), v216 (ref), v18 (ref), v12 (ref), l_lerp_0 (ref), v59 (ref)
        if not globals.is_connected or not globals.is_in_game then
            return;
        else
            local v286 = entity.get_local_player();
            if not v286 or not v286:is_alive() then
                return;
            elseif not v134.visuals.indicators:get() then
                return;
            elseif not v216.visuals then
                return;
            else
                local l_value_0 = v134.visuals.indicators.color.value;
                local l_r_0 = l_value_0.r;
                local l_g_0 = l_value_0.g;
                local l_b_0 = l_value_0.b;
                local _ = l_value_0.a;
                if v18.doubletap:get() then
                    v285.dt_text = rage.exploit:get() == 0 and {
                        "waiting", 
                        color(255, 150, 150, 255)
                    } or rage.exploit:get() > 0 and rage.exploit:get() < 1 and {
                        "charging", 
                        color(255 - (255 - l_r_0), rage.exploit:get() * l_g_0, rage.exploit:get() * l_b_0, 255)
                    } or rage.exploit:get() == 1 and {
                        [1] = "ready", 
                        [2] = l_value_0
                    };
                end;
                if v18.hideshots:get() then
                    if v18.doubletap:get() then
                        v285.hs_text = {
                            "blocked", 
                            color(255, 150, 150, 255)
                        };
                    else
                        v285.hs_text = rage.exploit:get() == 0 and {
                            "waiting", 
                            color(255, 150, 150, 255)
                        } or rage.exploit:get() > 0 and rage.exploit:get() < 1 and {
                            "charging", 
                            color(255 - (255 - l_r_0), rage.exploit:get() * l_g_0, rage.exploit:get() * l_b_0, 255)
                        } or rage.exploit:get() == 1 and {
                            [1] = "hiding", 
                            [2] = l_value_0
                        };
                    end;
                end;
                local v292 = ui.get_binds();
                local v293 = false;
                local v294 = false;
                local v295 = false;
                for _, v297 in pairs(v292) do
                    if v297.active then
                        if v297.name == "Min. Damage" then
                            v293 = true;
                        elseif v297.name == "Safe Points" then
                            v295 = true;
                        elseif v297.name == "Body Aim" then
                            v294 = true;
                        end;
                    end;
                end;
                local v298 = {
                    [1] = {
                        name = "damage", 
                        enabled = v134.visuals.indicators.items:get("damage"), 
                        active = v293, 
                        color = color(l_r_0, l_g_0, l_b_0)
                    }, 
                    [2] = {
                        name = "baim", 
                        enabled = v134.visuals.indicators.items:get("baim"), 
                        active = v294, 
                        color = color(l_r_0, l_g_0, l_b_0)
                    }, 
                    [3] = {
                        name = "safe", 
                        enabled = v134.visuals.indicators.items:get("safepoint"), 
                        active = v295, 
                        color = color(l_r_0, l_g_0, l_b_0)
                    }, 
                    [4] = {
                        name = "freestand", 
                        enabled = v134.visuals.indicators.items:get("freestand"), 
                        active = v18.freestanding:get() or v134.antiaim.manuals:get() == "freestand", 
                        color = color(l_r_0, l_g_0, l_b_0)
                    }, 
                    [5] = {
                        name = "fakeduck", 
                        enabled = v134.visuals.indicators.items:get("fakeduck"), 
                        active = v18.fakeduck:get(), 
                        color = color(l_r_0, l_g_0, l_b_0)
                    }
                };
                local v299 = 0;
                render.text(1, vector(v12.screensize.x / 2, v12.screensize.y / 2 + 15), color(math.clamp(l_r_0 + 30, 0, 255), math.clamp(l_g_0 + 30, 0, 255), math.clamp(l_b_0 + 30, 0, 255), 255), "c b", "luminaria");
                l_lerp_0.lerp("i_doubletap", v18.doubletap:get() and v134.visuals.indicators.items:get("doubletap") and 1 or 0, 45);
                dt_text_offset = l_lerp_0.lerp("smoothdt", render.measure_text(1, "c b", v285.dt_text[1]).x, 50);
                render.text(1, vector(v12.screensize.x / 2 - 7 - dt_text_offset / 4, v12.screensize.y / 2 + 25), color(l_r_0, l_g_0, l_b_0, l_lerp_0.get("i_doubletap") * 255), "c b", "dt");
                render.text(1, vector(v12.screensize.x / 2 - 1 + dt_text_offset / 4, v12.screensize.y / 2 + 25), color(v285.dt_text[2].r, v285.dt_text[2].g, v285.dt_text[2].b, l_lerp_0.get("i_doubletap") * 255), "c b", v285.dt_text[1]);
                v299 = v299 + l_lerp_0.get("i_doubletap") * 10;
                l_lerp_0.lerp("i_hideshots", v18.hideshots:get() and v134.visuals.indicators.items:get("hideshots") and 1 or 0, 45);
                hs_text_offset = l_lerp_0.lerp("smoothhs", render.measure_text(1, "c b", v285.hs_text[1]).x, 50);
                render.text(1, vector(v12.screensize.x / 2 - 8 - hs_text_offset / 4, v12.screensize.y / 2 + 25 + l_lerp_0.get("i_doubletap") * 10), color(l_r_0, l_g_0, l_b_0, l_lerp_0.get("i_hideshots") * 255), "c b", "hs");
                render.text(1, vector(v12.screensize.x / 2 - 1 + hs_text_offset / 4, v12.screensize.y / 2 + 25 + l_lerp_0.get("i_doubletap") * 10), color(v285.hs_text[2].r, v285.hs_text[2].g, v285.hs_text[2].b, l_lerp_0.get("i_hideshots") * 255), "c b", v285.hs_text[1]);
                v299 = v299 + l_lerp_0.get("i_hideshots") * 10;
                for _, v301 in pairs(v298) do
                    v285.db[v301.name] = v59.animation:new("i_" .. v301.name, v301.enabled and v301.active and 1 or 0, 45);
                    render.text(1, vector(v12.screensize.x / 2, v12.screensize.y / 2 + 25 + v299), color(v301.color.r, v301.color.g, v301.color.b, v285.db[v301.name] * 255), "c b", v301.name);
                    v299 = v299 + v285.db[v301.name] * 10;
                end;
                return;
            end;
        end;
    end, 
    animtext = l_gradient_0.text_animate("L U M I N A R I A", -2, {
        color(0, 0, 0, 50), 
        v134.visuals.indicators.color:get()
    }), 
    render_watermark = function(v302)
        -- upvalues: v17 (ref)
        if not globals.is_connected or not globals.is_in_game then
            return;
        else
            local v303 = entity.get_local_player();
            if not v303 or not v303:is_alive() then
                return;
            else
                v302.animtext:animate();
                render.text(1, vector(v17.size.x / 2, v17.size.y - 10), color(255, 0, 255), "c", v302.animtext:get_animated_text());
                return;
            end;
        end;
    end
};
local v348 = {
    amount = 1, 
    color = "", 
    db = {}, 
    table = {}, 
    push_notify = function(v305, v306, v307, v308)
        -- upvalues: v134 (ref), l_pui_0 (ref)
        local v309 = 0;
        for _, v311 in pairs(v305.table) do
            if v311 ~= nil then
                v309 = v309 + 1;
            end;
        end;
        if v134.misc.logs.screen:get() == "default" then
            if v309 > 9 then
                local v312 = v309 - 9;
                local v313 = 0;
                for _, v315 in pairs(v305.table) do
                    v315.timer = globals.realtime + 0.2 - math.abs(v312 - v313);
                    v313 = v313 + 1;
                    if v312 <= v313 then
                        break;
                    end;
                end;
            end;
        elseif v309 > 32 then
            local v316 = v309 - 32;
            local v317 = 0;
            for _, v319 in pairs(v305.table) do
                v319.timer = globals.realtime + 0.2 - math.abs(v316 - v317);
                v317 = v317 + 1;
                if v316 <= v317 then
                    break;
                end;
            end;
        end;
        v305.table[#v305.table + 1] = {
            string = l_pui_0.string(v306), 
            timer = globals.realtime + 5, 
            hello = globals.realtime + 0.2, 
            test = v307, 
            funny = math.random(0, 1000) == 1, 
            target = v308 and v308 or false
        };
    end, 
    remove_notify = function(v320)
        local v321 = 0;
        for _, v323 in pairs(v320.table) do
            v321 = v321 + 1;
            if v323 ~= nil then
                v323.timer = globals.realtime + 0.2;
            end;
        end;
    end, 
    handle = function(v324)
        -- upvalues: v17 (ref), v134 (ref), v60 (ref)
        local v325 = v17.size.y - 50;
        local v326 = 0;
        v324.color = v134.misc.logs.color:get();
        for v327, v328 in pairs(v324.table) do
            if v328 ~= nil and v134.misc.logs.types:get("on screen") then
                if v134.misc.logs.screen:get() == "default" then
                    if v328.timer < globals.realtime then
                        v324.table[v327] = nil;
                    else
                        local v329 = math.clamp((v328.timer - globals.realtime) / 0.2, 0, 1);
                        local v330 = string.upper(v328.string);
                        local v331 = vector(v17.size.x / 2 - render.measure_text(2, "", v330).x / 2 - 5, v325 - v326 - 6);
                        render.rect(v331, v331 + vector(render.measure_text(2, "", v330).x + 8, 14), color(0, 0, 0, v329 * 150), 0, true);
                        render.rect(v331 + vector(0, 13), v331 + vector((v328.timer - globals.realtime) / 5 * (render.measure_text(2, "", v330).x + 5), 13), color(255, 255, 255, v329 * 150), 0, true);
                        render.text(2, vector(v17.size.x / 2 - render.measure_text(2, "", v330).x / 2, v325 - v326 - render.measure_text(2, "", v330).y / 2), color(255, 255, 255, v329 * 255), "", v330);
                        v326 = v326 + v329 * 18;
                    end;
                elseif v328.timer < globals.realtime then
                    v324.table[v327] = nil;
                else
                    local v332 = math.clamp((v328.hello - globals.realtime) / 0.2, 0, 1);
                    local v333 = math.clamp((v328.timer - globals.realtime) / 0.2, 0, 1);
                    local v334 = string.upper(v328.string);
                    local v335 = vector(v17.size.x - render.measure_text(2, "", v334).x - render.measure_text(2, "", v334).x * -v332, v17.size.y / 2 - v326 + 100);
                    render.rect(v335, v335 + vector(render.measure_text(2, "", v334).x + 5, 20), color(0, 0, 0, v333 * 150), 0, true);
                    render.rect(v335 + vector(0, 18), v335 + vector((v328.timer - globals.realtime) / 5 * (render.measure_text(2, "", v334).x + 5), 20), color(255, 255, 255, v333 * 150), 0, true);
                    if v328.funny and v328.target == entity.get_local_player() then
                        render.texture(v60.xane, v335 - vector(20, 0));
                    elseif v328.target == false then
                        render.texture(v60.default, v335 - vector(20, 0), vector(20, 20));
                    else
                        render.texture(v328.target:get_steam_avatar(), v335 - vector(20, 0), vector(20, 20));
                    end;
                    render.text(2, vector(v17.size.x - render.measure_text(2, "", v334).x - render.measure_text(2, "", v334).x * -v332 + 1, v17.size.y / 2 - v326 + 103), color(255, 255, 255, v333 * 255), "", v334);
                    v326 = v326 + v333 * 22;
                end;
            end;
        end;
    end, 
    shot = function(v336, v337)
        -- upvalues: v103 (ref)
        local l_id_0 = v337.id;
        v336.db[l_id_0] = {};
        v336.db[l_id_0].shot_pos = v337.target:get_origin();
        v336.db[l_id_0].shot_vel = v103.getvelocity(v337.target);
        v336.db[l_id_0].shot_tick = globals.tickcount;
        local v339 = v337.target:get_player_weapon();
        if not v339 then
            v336.db[l_id_0].onshot = false;
        else
            local v340 = v336.db[l_id_0];
            local v341;
            if not v339.m_fLastShotTime or globals.curtime - v339.m_fLastShotTime >= 0.5 then
                v341 = false;
            else
                v341 = true;
            end;
            v340.onshot = v341;
        end;
    end, 
    result = function(v342, v343)
        -- upvalues: l_pui_0 (ref), v134 (ref), v10 (ref), v19 (ref)
        l_pui_0.colors.logs = v342.color;
        local l_id_1 = v343.id;
        local v345 = false;
        local l_state_1 = v343.state;
        local v347 = (v343.target:get_origin() - v342.db[l_id_1].shot_pos):length();
        if (v342.db[l_id_1].shot_vel * vector(globals.tickinterval, globals.tickinterval, globals.tickinterval) * vector(globals.tickcount - v342.db[l_id_1].shot_tick + 5, globals.tickcount - v342.db[l_id_1].shot_tick + 5, globals.tickcount - v342.db[l_id_1].shot_tick + 5)):length() < v347 and v347 > 10 then
            v345 = true;
        end;
        if l_state_1 == "correction" and v345 then
            l_state_1 = "lagcomp failure";
        end;
        if v343.state == nil then
            if v134.misc.logs.types:get("console") then
                v10(string.format("Hit %s(%i%%) in %s(%s) for %i(%i) damage | history(\206\148): %i%s%s", v343.target:get_name(), v343.hitchance, v19[v343.hitgroup], v19[v343.wanted_hitgroup], v343.damage, v343.wanted_damage, v343.backtrack, v342.db[l_id_1].onshot and " | onshot" or "", v345 and " | teleported" or ""));
            end;
            if v134.misc.logs.types:get("top left") then
                print_dev(string.format("Hit %s(%i%%) in %s(%s) for %i(%i) damage | history(\206\148): %i%s%s", v343.target:get_name(), v343.hitchance, v19[v343.hitgroup], v19[v343.wanted_hitgroup], v343.damage, v343.wanted_damage, v343.backtrack, v342.db[l_id_1].onshot and " | onshot" or "", v345 and " | teleported" or ""));
            end;
            v342:push_notify(string.format(l_pui_0.string("Hit\a[logs]  %s \r(%i%%)  in \a[logs] %s  \r(%s)  for \a[logs] %i  \r(%i)  damage"), v343.target:get_name(), v343.hitchance, v19[v343.hitgroup], v19[v343.wanted_hitgroup], v343.damage, v343.wanted_damage), false, v343.target);
        else
            if v134.misc.logs.types:get("console") then
                v10(string.format("Missed %s(%i%%) in %s for %i damage due to %s | history(\206\148): %i%s%s", v343.target:get_name(), v343.hitchance, v19[v343.wanted_hitgroup], v343.wanted_damage, l_state_1, v343.backtrack, v342.db[l_id_1].onshot and " | onshot" or "", v345 and " | teleported" or ""));
            end;
            if v134.misc.logs.types:get("top left") then
                print_dev(string.format("Missed %s(%i%%) in %s for %i damage due to %s | history(\206\148): %i%s%s", v343.target:get_name(), v343.hitchance, v19[v343.wanted_hitgroup], v343.wanted_damage, l_state_1, v343.backtrack, v342.db[l_id_1].onshot and " | onshot" or "", v345 and " | teleported" or ""));
            end;
            v342:push_notify(string.format(l_pui_0.string("Missed \a[logs] %s  \r(%i%%) in \a[logs] %s  \r for \a[logs] %i  \rdamage due to \a[logs] %s"), v343.target:get_name(), v343.hitchance, v19[v343.wanted_hitgroup], v343.wanted_damage, l_state_1), false, v343.target);
        end;
    end
};
local v357 = {
    _WaitTime = 0.25, 
    _FadeTime = 0.25, 
    fadetime = 1, 
    m_hit = false, 
    hit = function(v349, v350)
        if entity.get_local_player() == entity.get(v350.attacker, true) then
            v349.m_hit = true;
            v349._FadeTime = 0.25;
            v349._WaitTime = 0.25;
            v349.fadetime = 1;
        end;
    end, 
    spawn = function(v351, v352)
        if entity.get_local_player() == entity.get(v352.userid, true) then
            v351._FadeTime = 0.25;
            v351._WaitTime = 0.5;
            v351.fadetime = 1;
            v351.m_hit = false;
        end;
    end, 
    draw = function(v353)
        -- upvalues: v134 (ref)
        if globals.is_in_game == false then
            return;
        elseif not v134.visuals.hitmarker:get() then
            return;
        else
            if v353.m_hit then
                local v354 = v134.visuals.hitmarker.color:get();
                local v355 = render.screen_size();
                v353._WaitTime = v353._WaitTime - globals.frametime;
                if v353._WaitTime <= 0 then
                    v353.fadetime = v353.fadetime - 1 / v353._FadeTime * globals.frametime;
                end;
                render.line(vector(v355.x / 2 - 5, v355.y / 2 + 5), vector(v355.x / 2 - 10 / v355.x * v355.x, v355.y / 2 + 10 / v355.y * v355.y), color(v354.r, v354.g, v354.b, v354.a * v353.fadetime));
                render.line(vector(v355.x / 2 - 5, v355.y / 2 - 5), vector(v355.x / 2 - 10 / v355.x * v355.x, v355.y / 2 - 10 / v355.y * v355.y), color(v354.r, v354.g, v354.b, v354.a * v353.fadetime));
                render.line(vector(v355.x / 2 + 5, v355.y / 2 - 5), vector(v355.x / 2 + 10 / v355.x * v355.x, v355.y / 2 - 10 / v355.y * v355.y), color(v354.r, v354.g, v354.b, v354.a * v353.fadetime));
                render.line(vector(v355.x / 2 + 5, v355.y / 2 + 5), vector(v355.x / 2 + 10 / v355.x * v355.x, v355.y / 2 + 10 / v355.y * v355.y), color(v354.r, v354.g, v354.b, v354.a * v353.fadetime));
            end;
            return;
        end;
    end, 
    start = function(v356)
        v356.m_hit = false;
        v356.fadetime = 1;
        v356._FadeTime = 0.25;
        v356._WaitTime = 0.25;
    end
};
local v385 = {
    render_indicator = function(v358, v359, v360, v361, v362, _)
        -- upvalues: v61 (ref)
        local v364 = render.screen_size().x / 100 + 9;
        local v365 = render.screen_size().y / 1.47;
        ts = render.measure_text(v61.gs_font, nil, v358);
        render.gradient(vector(v364 / 1.9, v365 + v359), vector(v364 / 1.9 + ts.x / 2 + 5, v365 + v359 + ts.y + 11), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50));
        render.gradient(vector(v364 / 1.9 + ts.x / 2 + 5, v365 + v359), vector(v364 / 1.9 + ts.x + 40, v365 + v359 + ts.y + 11), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0));
        render.text(v61.gs_font, vector(v364, v365 + 8 + v359), v360, nil, v358);
        if v361 and v362 then
            render.circle_outline(vector(v364 + ts.x + 18, v365 + v359 + ts.y / 2 + 8), color(0, 0, 0, 255), 10, 1, 10, 5);
            render.circle_outline(vector(v364 + ts.x + 18, v365 + v359 + ts.y / 2 + 8), v361, 9, 1, v362, 3);
        end;
    end, 
    indicators = function(v366, _)
        -- upvalues: v134 (ref), v18 (ref)
        if not v134.visuals.indicators_xyini:get() then
            return;
        else
            local v368 = entity.get_local_player();
            if v368 == nil then
                return;
            else
                local _ = 0;
                local _ = false;
                local _ = 0;
                local _ = 0;
                local v373 = 40;
                local v374 = 0;
                for _, v376 in ipairs(entity.get_players(true)) do
                    if v376 == nil then
                        fnayf = false;
                    end;
                    if v376 ~= nil and v376:is_enemy() and v376:is_dormant() then
                        fnayf = true;
                    else
                        fnayf = false;
                    end;
                end;
                local v377 = false;
                local _ = 0;
                local v379 = ui.get_binds();
                for _, v381 in pairs(v379) do
                    if v381.active and v381.name == "Min. Damage" then
                        v377 = true;
                    end;
                end;
                local v382 = {
                    [1] = {
                        "PING", 
                        v134.visuals.indicators_xyini.types:get("Fake Ping") and v368:is_alive() and ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):get() > 0 and v368:is_alive(), 
                        color(163, 194, 43)
                    }, 
                    [2] = {
                        "BODY", 
                        v134.visuals.indicators_xyini.types:get("Force Baim") and v368:is_alive() and v18.baim:get() == "Force", 
                        color(200, 199, 197)
                    }, 
                    [3] = {
                        [1] = "DT", 
                        [2] = v134.visuals.indicators_xyini.types:get("Doubletap") and v368:is_alive() and ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and not ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get(), 
                        [3] = rage.exploit:get() == 1 and color(200, 199, 197) or color(255, 0, 50)
                    }, 
                    [4] = {
                        [1] = "DA", 
                        [2] = v134.visuals.indicators_xyini.types:get("Dormant Aimbot") and v368:is_alive() and ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"):get(), 
                        [3] = fnayf == true and color(200, 199, 197) or color(255, 0, 50)
                    }, 
                    [5] = {
                        "DUCK", 
                        v134.visuals.indicators_xyini.types:get("Fake Duck") and v368:is_alive() and ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get(), 
                        color(200, 199, 197)
                    }, 
                    [6] = {
                        "MD", 
                        v134.visuals.indicators_xyini.types:get("Minimum Damage") and v368:is_alive() and v377 == true, 
                        color(200, 199, 197)
                    }, 
                    [7] = {
                        "FS", 
                        v134.visuals.indicators_xyini.types:get("Freestanding") and v368:is_alive() and (v18.freestanding:get() or v134.antiaim.manuals:get() == "freestand"), 
                        color(200, 199, 197)
                    }, 
                    [8] = {
                        "OSAA", 
                        v134.visuals.indicators_xyini.types:get("Hideshots") and v368:is_alive() and ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() and not ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and not ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get(), 
                        color(200, 199, 197)
                    }
                };
                for _, v384 in pairs(v382) do
                    if v384[2] then
                        v366.render_indicator(v384[1], v374, v384[3], v384[4], v384[5], v384[6]);
                        v374 = v374 - v373;
                    end;
                end;
                return;
            end;
        end;
    end
};
local v393 = {
    anim = {
        appearing_alpha = 0, 
        appearing = 0
    }, 
    handle = function(v386)
        -- upvalues: v134 (ref), v59 (ref), v17 (ref)
        if not v134.visuals.warnings.types:get("velocity") then
            return;
        else
            local v387 = entity.get_local_player();
            if not v387 or not v387:is_player() or not v387:is_alive() then
                return;
            else
                local v388 = v134.visuals.warnings.color:get();
                local l_m_flVelocityModifier_0 = v387.m_flVelocityModifier;
                local l_frametime_0 = globals.frametime;
                local v391 = ui.get_alpha() > 0.5;
                v386.anim.appearing = v59.lerp(v386.anim.appearing, (not (l_m_flVelocityModifier_0 >= 1) or v391) and 230 or 180, 0.06 + math.min(l_frametime_0 / 10.1, 0.25));
                v386.anim.appearing_alpha = v59.lerp(v386.anim.appearing_alpha, (not (l_m_flVelocityModifier_0 >= 1) or v391) and 255 or 0, 0.06 + math.min(l_frametime_0 / 10.1, 0.25));
                local _ = vector(v17.size.x / 2 - 60, math.floor(v386.anim.appearing));
                render.rect(vector(v17.size.x / 2 - 60, math.floor(v386.anim.appearing)), vector(v17.size.x / 2 - 60, math.floor(v386.anim.appearing)) + vector(120, 6), color(0, 0, 0, math.min(math.floor(v386.anim.appearing_alpha), 200)));
                render.rect(vector(v17.size.x / 2 - 58, math.floor(v386.anim.appearing + 2)), vector(v17.size.x / 2 - 58, math.floor(v386.anim.appearing + 2)) + vector(116 * l_m_flVelocityModifier_0, 2), color(v388.r, v388.g, v388.b, math.floor(v386.anim.appearing_alpha)));
                render.text(1, vector(v17.size.x / 2, math.floor(v386.anim.appearing) - 7), color(255, 255, 255, math.floor(v386.anim.appearing_alpha)), "c", string.format("- velocity %i%s -", math.abs(l_m_flVelocityModifier_0 * 100 + -100), "%"));
                return;
            end;
        end;
    end
};
local v402 = {
    anim = {
        appearing_alpha = 0
    }, 
    handle = function(v394)
        -- upvalues: v134 (ref), v30 (ref), v59 (ref), v17 (ref)
        if not v134.visuals.warnings.types:get("defensive") then
            return;
        else
            local v395 = entity.get_local_player();
            if not v395 or not v395:is_player() or not v395:is_alive() then
                return;
            else
                local v396 = v134.visuals.warnings.color:get();
                local l_m_flVelocityModifier_1 = v395.m_flVelocityModifier;
                local l_frametime_1 = globals.frametime;
                local v399 = ui.get_alpha() > 0.1;
                local v400 = v30:is_active(v395, true, true);
                local v401 = v400.tick - globals.tickcount > 1;
                v394.anim.appearing_alpha = v59.lerp(v394.anim.appearing_alpha, (not not v401 or v399) and 255 or 0, 0.06 + math.min(l_frametime_1 / 10.1, 0.25));
                render.rect(vector(v17.size.x / 2 - 60, 249), vector(v17.size.x / 2 - 60, 249) + vector(120, 6), color(0, 0, 0, math.min(math.floor(v394.anim.appearing_alpha), 200)));
                render.rect(vector(v17.size.x / 2 - 58, 251), vector(v17.size.x / 2 - 58, 251) + vector(116 + (v400.tick - globals.tickcount > 1 and (v400.tick - globals.tickcount) / 12 * -112 or 0), 2), color(v396.r, v396.g, v396.b, math.floor(v394.anim.appearing_alpha)), 0, true);
                render.text(1, vector(v17.size.x / 2, 242), color(255, 255, 255, math.floor(v394.anim.appearing_alpha)), "c", string.format("- defensive -", math.abs(l_m_flVelocityModifier_1 * 100 + -100), "%"));
                return;
            end;
        end;
    end
};
local v410 = {
    timing = 40, 
    reset = 0, 
    tag = {
        [1] = "", 
        [2] = "l", 
        [3] = "lu", 
        [4] = "lum", 
        [5] = "lumin", 
        [6] = "lumina", 
        [7] = "luminari", 
        [8] = "luminaria", 
        [9] = "luminaria.", 
        [10] = "luminaria.l", 
        [11] = "luminaria.lu", 
        [12] = "luminaria.lua", 
        [13] = "luminaria.lua", 
        [14] = "luminaria.l", 
        [15] = "luminaria.", 
        [16] = "luminaria", 
        [17] = "luminari", 
        [18] = "luminar", 
        [19] = "lumin", 
        [20] = "lumi", 
        [21] = "lum", 
        [22] = "l", 
        [23] = ""
    }, 
    get = function(v403)
        if not entity.get_local_player() then
            return;
        else
            local v404 = utils.net_channel().latency[0] / globals.tickinterval;
            local v405 = globals.tickcount + v404;
            local v406 = math.floor(math.fmod(v405 / v403.timing, #v403.tag + 1) + 1);
            return v403.tag[v406];
        end;
    end, 
    set = function(v407, v408)
        if not globals.is_connected or not globals.is_in_game then
            return;
        elseif v408 == v407.last then
            return;
        elseif v408 == nil then
            return;
        else
            common.set_clan_tag(v408);
            v407.last = v408;
            return;
        end;
    end, 
    handle = function(v409)
        -- upvalues: v134 (ref)
        if not globals.is_connected or not globals.is_in_game then
            return;
        elseif not entity.get_local_player() then
            return;
        else
            if v134.misc.clantag:get() then
                v409:set(v409:get());
                v409.reset = 0;
            elseif v409.reset < 1 then
                v409:set(" ");
                v409.reset = v409.reset + 1;
            end;
            return;
        end;
    end
};
local v414 = {
    breaker = function()
        -- upvalues: v59 (ref), v37 (ref), v134 (ref), v31 (ref), v18 (ref), l_ffi_0 (ref)
        local v411 = entity.get_local_player();
        if not v411 then
            return;
        elseif not v411:is_alive() then
            return;
        elseif not v59.get_anim_layer(v37(entity.get_local_player():get_index()), 12) then
            return;
        elseif not v134.misc.animation:get() then
            return;
        else
            local v412 = globals.client_tick % 4 > 1;
            if v134.misc.animation.ground:get() == "jitter" then
                v411.m_flPoseParameter[v31.STRAFE_YAW] = v412 and 1 or 0.7;
                v18.legmovement:set("Sliding");
            elseif v134.misc.animation.ground:get() == "skeet" then
                v18.legmovement:override("Sliding");
                v411.m_flPoseParameter[v31.STRAFE_YAW] = 1;
            elseif v134.misc.animation.ground:get() == "moonwalk" then
                v18.legmovement:override("Walking");
                v411.m_flPoseParameter[v31.STAND] = 0;
                v411.m_flPoseParameter[v31.MOVE_YAW] = 1;
            end;
            if v134.misc.animation.slide:get("run") then
                v18.legmovement:override("Sliding");
                v411.m_flPoseParameter[v31.MOVE_BLEND_RUN] = 0;
            end;
            if v134.misc.animation.slide:get("walk") then
                v18.legmovement:override("Sliding");
                v411.m_flPoseParameter[v31.MOVE_BLEND_WALK] = 0;
            end;
            if v134.misc.animation.slide:get("crouch") then
                v18.legmovement:override("Sliding");
                v411.m_flPoseParameter[v31.MOVE_BLEND_CROUCH] = 0;
                v411.m_flPoseParameter[v31.STAND] = v412 and 0.5 or 1;
            end;
            if v134.misc.animation.air:get() == "static" then
                v411.m_flPoseParameter[v31.JUMP_FALL] = 1;
            elseif v134.misc.animation.air:get() == "autistic" and bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 0)) == 0 and entity.get_local_player().m_vecVelocity:length2d() > 2 then
                v59.get_anim_layer(v37(entity.get_local_player():get_index()), 6).m_weight = 1;
            end;
            if entity.get_local_player().m_vecVelocity:length2d() > 2 then
                l_ffi_0.cast("C_AnimationLayer**", l_ffi_0.cast("uintptr_t", v37(v411:get_index())) + 10640)[0][12].m_weight = v134.misc.animation.lean:get() / 100;
                entity.get_local_player().m_flModelScale = 1;
                entity.get_local_player().m_ScaleType = 0;
            end;
            return;
        end;
    end, 
    legs = function(v413)
        -- upvalues: v134 (ref), v18 (ref)
        if v134.misc.animation.ground:get() == "Jitter" then
            v18.legmovement:override(v413.command_number % 3 == 0 and "Default" or "Sliding");
        end;
    end
};
local v421 = {
    nadestable = {
        [1] = "hegrenade", 
        [2] = "smokegrenade", 
        [3] = "incgrenade", 
        [4] = "molotov"
    }, 
    model = function(v415, _)
        -- upvalues: v134 (ref)
        if not v134.misc.model:get() then
            return;
        else
            local v417 = entity.get_local_player();
            if not v417 then
                return;
            else
                local v418 = v417:get_player_weapon();
                if not v418 then
                    return;
                else
                    local v419 = v418:get_weapon_info();
                    if not v419 then
                        return;
                    elseif v134.misc.model.types:get("Scoped") and v417.m_bIsScoped then
                        return v134.misc.model.scope:get();
                    else
                        if v134.misc.model.types:get("On Nade") then
                            for v420 = 1, #v415.nadestable do
                                if v419.weapon_name == "weapon_" .. v415.nadestable[v420] then
                                    return v134.misc.model.nade:get();
                                end;
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end
};
local v433 = {
    phrases = {
        [1] = "1", 
        [2] = "1 nn", 
        [3] = "\209\129\208\191\208\184 \208\191\208\184\208\180\208\176\209\128\208\176\209\129\208\186\208\176", 
        [4] = "hdf hurensohn", 
        [5] = "\209\143 \209\130\208\178\208\190\209\142 \208\188\208\176\209\130\209\140 \208\181\208\177\208\176\208\187 \208\186\208\187\208\190\208\191", 
        [6] = "luminaria.lua > all world", 
        [7] = "raped", 
        [8] = "\209\129\208\191\208\184 \208\178\208\181\209\135\208\189\209\139\208\188 \209\129\208\189\208\190\208\188", 
        [9] = "\226\156\180.\194\183\194\180\194\175`\194\183.\194\183\226\152\133 \240\159\142\1281\240\159\142\128 \226\152\133\194\183.\194\183`\194\175\194\180\194\183.\226\156\180", 
        [10] = "ur shit faggot", 
        [11] = "stfu", 
        [12] = "deport bot by luminaria", 
        [13] = "\208\180\208\181\208\191\208\190\209\128\209\130\208\184\209\128\208\190\208\178\208\176\208\189 \208\178 \208\176\208\180 \208\186 \208\188\208\176\209\130\208\181\209\128\208\184 \209\136\208\187\209\142\209\133\208\181", 
        [14] = "\209\129\208\189\208\190\208\178\208\176 \209\133\209\131\208\185 \208\178 \208\182\208\190\208\191\208\181", 
        [15] = "\209\135\209\130\208\190 \209\129 \208\181\208\177\208\176\208\187\208\190\208\188 \208\188\208\190\209\135\208\176?", 
        [16] = "\208\180\208\181\208\187\208\176\208\185 \208\188\208\189\208\181 \208\188\208\184\208\189\208\181\209\130 \208\191\208\184\208\180\208\176\209\128\208\176\209\129", 
        [17] = "cya in hell", 
        [18] = "awesome gaming carpet", 
        [19] = "yt bot", 
        [20] = "hs", 
        [21] = "lol  opyati \208\178\209\139\208\181\208\177\208\176\208\187 \209\130\208\181\208\177\209\143", 
        [22] = "\208\178\209\139\208\181\208\177\208\176\208\189 \208\180\208\181\208\179\208\181\208\189\208\181\209\128\208\176\209\130", 
        [23] = "deported"
    }, 
    he_phrases = {
        [1] = "bombed like the kremlin", 
        [2] = "bomboclat", 
        [3] = "kobe", 
        [4] = "get icbmd", 
        [5] = "you talking mad shit for someone in icmbing distance", 
        [6] = "BOMBOCLAAAT", 
        [7] = "airstriked", 
        [8] = "get arabed"
    }, 
    fire_phrases = {
        [1] = "deepfried", 
        [2] = "fried by luminaria", 
        [3] = "burn jew", 
        [4] = "burned jew", 
        [5] = "Murr hurr mphuphurrur, hurr mph phrr.", 
        [6] = "go burn"
    }, 
    blind_phrases = {
        [1] = "Think fast chucklenuts", 
        [2] = "HE'S PULLING HIS COCK OUT, HE'S PULLING HIS COCK OUT"
    }, 
    friendly_phrases = {
        [1] = "IT WAS A MISINPUT, MISINPUT, CALM DOWN, YOU CALM THE FUCK DOWN", 
        [2] = "misclick"
    }, 
    random = function(v422, v423)
        if not v423 then
            v423 = 0;
        end;
        local v424 = v423 == "nade" and v422.he_phrases or v423 == "molly" and v422.fire_phrases or v423 == "blind" and v422.blind_phrases or v422.phrases;
        return v424[utils.random_int(1, #v424)]:gsub("\"", "");
    end, 
    blind = function(v425, v426)
        -- upvalues: v134 (ref)
        local v427 = entity.get_local_player();
        if v427 == nil or v427:is_alive() == false then
            return;
        else
            local v428 = entity.get(v426.userid, true);
            if v134.misc.trashtalk:get() and v427 == v428 and v426.weapon == "flashbang" then
                utils.console_exec("say \"" .. v425:random("blind") .. "\"");
            end;
            return;
        end;
    end, 
    killsay = function(v429, v430)
        -- upvalues: v134 (ref)
        local v431 = entity.get_local_player();
        if v431 == nil or v431:is_alive() == false then
            return;
        else
            local v432 = entity.get(v430.attacker, true);
            if v134.misc.trashtalk:get() and v431 == v432 then
                if v430.weapon == "hegrenade" then
                    utils.console_exec("say \"" .. v429:random("nade") .. "\"");
                elseif v430.weapon == "inferno" then
                    utils.console_exec("say \"" .. v429:random("molly") .. "\"");
                else
                    utils.console_exec("say \"" .. v429:random() .. "\"");
                end;
            end;
            return;
        end;
    end
};
local v457 = {
    vector = function(v434, v435)
        local v436 = nil;
        local v437 = nil;
        local v438 = nil;
        local v439 = nil;
        v436 = math.sin(math.rad(v434));
        v437 = math.sin(math.rad(v435));
        v438 = math.cos(math.rad(v434));
        v439 = math.cos(math.rad(v435));
        return vector(v438 * v439, v438 * v437, -v436);
    end, 
    velocity = function(v440)
        if v440 == nil then
            return;
        else
            return (v440.m_vecVelocity:length());
        end;
    end, 
    handle = function(v441, v442)
        -- upvalues: v134 (ref)
        local v443 = entity.get_local_player();
        if not v443 then
            return;
        elseif not v134.misc.walls:get() then
            return;
        else
            local v444 = v134.misc.walls.distance:get();
            local l_y_1 = render.camera_angles().y;
            local l_m_vecOrigin_0 = v443.m_vecOrigin;
            local l_huge_0 = math.huge;
            local l_huge_1 = math.huge;
            for v449 = 1, 180 do
                local l_x_0 = v441.vector(0, l_y_1 + v449 - 90).x;
                local l_y_2 = v441.vector(0, l_y_1 + v449 - 90).y;
                local _ = v441.vector(0, l_y_1).z;
                local v453 = l_m_vecOrigin_0.x + l_x_0 * 70;
                local v454 = l_m_vecOrigin_0.y + l_y_2 * 70;
                local v455 = l_m_vecOrigin_0.z + 60;
                local v456 = utils.trace_line(l_m_vecOrigin_0, vector(v453, v454, v455), nil, nil, 1);
                if l_m_vecOrigin_0:dist(v456.end_pos) < l_huge_0 then
                    l_huge_0 = l_m_vecOrigin_0:dist(v456.end_pos);
                    l_huge_1 = v449;
                end;
            end;
            if l_huge_0 < 25 + v444 and v442.in_jump and not v442.in_moveright and not v442.in_moveleft and not v442.in_back then
                forward_velo = math.abs(v441.velocity(v443) * math.cos(math.rad(l_huge_1)));
                if math.abs(l_huge_1 - 90) < 40 then
                    side_velo = v441.velocity(v443) * math.sin(math.rad(l_huge_1)) * (25 + v444 - l_huge_0) / 15;
                else
                    side_velo = v441.velocity(v443) * math.sin(math.rad(l_huge_1));
                end;
                v442.forwardmove = forward_velo;
                if l_huge_1 >= 90 then
                    v442.sidemove = side_velo;
                else
                    v442.sidemove = side_velo * -1;
                end;
            end;
            return;
        end;
    end
};
local v459 = {
    menu = function()
        -- upvalues: v134 (ref), v18 (ref)
        if v134.misc.nadefix:get() then
            v18.actions:override(v18.actions:get("Auto Pistols") and "Auto Pistols" or "");
        else
            v18.actions:override();
        end;
    end, 
    throwing = function(v458)
        if entity.get(v458.userid, true) == entity.get_local_player() then
            utils.console_exec("slot2");
            utils.console_exec("slot1");
        end;
    end
};
local v470 = {
    scale = {
        arms = 0.75, 
        stomach = 1.25, 
        chest = 1, 
        head = 4, 
        legs = 0.75
    }, 
    calculate = function(v460, v461, v462, v463)
        if not v461 then
            return 0;
        elseif not v461:get_player_weapon() then
            return 0;
        else
            local v464 = v461:get_player_weapon():get_weapon_info();
            if not v464 then
                return 0;
            else
                local v465 = v461.m_vecAbsOrigin:dist(v462.m_vecAbsOrigin);
                local v466 = v464.damage * math.pow(v464.range_modifier, v465 * 0.002);
                local l_m_ArmorValue_0 = v462.m_ArmorValue;
                local v468 = v466 * (v464.armor_ratio * 0.5);
                if l_m_ArmorValue_0 < v466 - v466 * (v464.armor_ratio * 0.5) * 0.5 then
                    v468 = v466 - l_m_ArmorValue_0 / 0.5;
                end;
                local _ = v462.m_iHealth;
                return v468 * v460.scale[v463];
            end;
        end;
    end
};
local v514 = {
    zeus_fixing = false, 
    js_type = 0, 
    js_hc = false, 
    is_saving = false, 
    baiming_value = " ", 
    is_baiming = false, 
    is_revving = false, 
    smart_baim = function(v471)
        -- upvalues: v18 (ref), v134 (ref), v470 (ref)
        v18.baim:override();
        v471.is_baiming = false;
        v471.baiming_value = " ";
        if not v134.helpers.smartbody:get() then
            return;
        else
            local v472 = entity.get_local_player();
            if not v472 or not v472:is_alive() then
                return;
            else
                local v473 = v472:get_player_weapon();
                if not v473 then
                    return;
                elseif v473:get_weapon_info().weapon_type == 0 then
                    return;
                else
                    local v474 = entity.get_threat(true) or entity.get_threat();
                    if not v474 then
                        return;
                    elseif v474:is_dormant() then
                        return;
                    else
                        local l_m_iHealth_1 = v474.m_iHealth;
                        local v476 = v470:calculate(v472, v474, "stomach");
                        local v477 = v470:calculate(v472, v474, "chest");
                        if l_m_iHealth_1 < v470:calculate(v472, v474, "legs") then
                            v18.baim:override("Force");
                            v471.is_baiming = true;
                            v471.baiming_value = "Force";
                        elseif l_m_iHealth_1 < v477 then
                            v18.baim:override("Prefer");
                            v471.is_baiming = true;
                            v471.baiming_value = "Prefer";
                        elseif l_m_iHealth_1 < v476 then
                            v18.baim:override("Prefer");
                            v471.is_baiming = true;
                            v471.baiming_value = "Prefer";
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end, 
    smart_safe = function(v478)
        -- upvalues: v18 (ref), v134 (ref), v470 (ref)
        v18.safe:override();
        v478.is_saving = false;
        if not v134.helpers.smartsafe:get() then
            return;
        else
            local v479 = entity.get_local_player();
            if not v479 or not v479:is_alive() then
                return;
            else
                local v480 = entity.get_threat(true) or entity.get_threat();
                if not v480 then
                    return;
                else
                    local v481 = v480:get_player_weapon();
                    if not v481 then
                        return;
                    else
                        local v482 = v479:get_player_weapon();
                        if not v482 then
                            return;
                        elseif v482:get_weapon_info().weapon_type == 0 then
                            return;
                        else
                            local l_m_iHealth_2 = v480.m_iHealth;
                            local v484 = v480:get_origin();
                            local v485 = v479:get_origin();
                            local v486 = v470:calculate(v479, v480, "stomach");
                            local v487;
                            if not v481.m_fLastShotTime or globals.curtime - v481.m_fLastShotTime >= 0.5 then
                                v487 = false;
                            else
                                v487 = true;
                            end;
                            local v488 = v481:get_weapon_info().weapon_type == 8;
                            local v489 = v485.z - v484.z > 47;
                            if l_m_iHealth_2 < v486 and v134.helpers.smartsafe.mode:get("lethal") then
                                v18.safe:override(v134.helpers.smartsafe.mode:get());
                                v478.is_saving = true;
                            elseif v487 and v134.helpers.smartsafe.mode:get("onshot") then
                                v18.safe:override(v134.helpers.smartsafe.mode:get());
                                v478.is_saving = true;
                            elseif v488 and v134.helpers.smartsafe.mode:get("holding name") then
                                v18.safe:override(v134.helpers.smartsafe.mode:get());
                                v478.is_saving = true;
                            elseif v489 and v134.helpers.smartsafe.mode:get("height advantage") then
                                v18.safe:override(v134.helpers.smartsafe.mode:get());
                                v478.is_saving = true;
                            end;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end, 
    airstop = function(v490)
        -- upvalues: v18 (ref), v134 (ref)
        v18.autostop_scout:override();
        v18.hitchance_scout:override();
        v490.js_hc = false;
        v490.js_type = 0;
        if not v134.helpers.smartjump:get() then
            return;
        else
            local v491 = v18.autostop_scout:get();
            local v492 = 0;
            for v493 = 1, #v491 do
                if v491[v493] == "In Air" then
                    v492 = v493;
                    break;
                end;
            end;
            table.remove(v491, v492);
            v18.autostop_scout:override({
                [1] = nil, 
                [2] = "In Air", 
                [1] = table.unpack(v18.autostop_scout:get())
            });
            local v494 = entity.get_local_player();
            if not v494 or not v494:is_alive() then
                return;
            else
                local v495 = entity.get_threat(true) or entity.get_threat();
                if not v495 or v495:is_dormant() then
                    return;
                else
                    local l_m_fFlags_3 = v494.m_fFlags;
                    local v497 = bit.band(l_m_fFlags_3, bit.lshift(1, 0)) == 0;
                    local v498 = (v494:get_origin() - v495:get_origin()):length2d();
                    local v499 = v494.m_vecVelocity:length2d();
                    local v500 = 0;
                    if 100 - v498 / 100 * 5 > 0 then
                        v500 = math.floor(100 - v498 / 100 * 5);
                    else
                        v500 = 40;
                    end;
                    local v501 = false;
                    if v134.helpers.smartjump.options:get("limit distance") and v134.helpers.smartjump.distance:get() < v498 then
                        v501 = true;
                    end;
                    if v134.helpers.smartjump.options:get("limit velocity") and v134.helpers.smartjump.velocity:get() < v499 then
                        v501 = true;
                    end;
                    if v134.helpers.smartjump.options:get("adaptive hitchance") and v497 then
                        v18.hitchance_scout:override(v500);
                        v490.js_type = 2;
                        v490.js_hc = v500;
                    end;
                    if v501 then
                        v18.autostop_scout:override(v491);
                        v490.js_type = 1;
                    end;
                    return;
                end;
            end;
        end;
    end, 
    zeus_fix = function(v502)
        -- upvalues: v18 (ref), v134 (ref)
        v18.hitchance_zeus:override();
        v502.zeus_fixing = false;
        if not v134.helpers.customzeus:get() then
            return;
        else
            local v503 = entity.get_local_player();
            if not v503 or not v503:is_alive() then
                return;
            else
                local v504 = entity.get_threat(true) or entity.get_threat();
                if not v504 then
                    return;
                else
                    local v505 = v503:get_player_weapon();
                    if not v505 then
                        return;
                    else
                        local v506 = v505:get_weapon_info();
                        local v507 = v505:get_inaccuracy() / 1000;
                        if not v504:get_origin() then
                            return;
                        else
                            local v508 = (v503:get_origin() - v504:get_origin()):length2d();
                            if v506.weapon_name ~= "weapon_taser" then
                                return;
                            else
                                if v507 < 1.5E-4 and v508 < 130 then
                                    v18.hitchance_zeus:override(25);
                                    v502.zeus_fixing = true;
                                elseif v507 < 1.0E-4 then
                                    v18.hitchance_zeus:override(10);
                                    v502.zeus_fixing = true;
                                end;
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end, 
    revo_fix = function(v509)
        -- upvalues: v18 (ref), v134 (ref)
        v18.hslag:override();
        v509.is_revving = false;
        local v510 = entity.get_local_player();
        if not v510 then
            return;
        else
            local v511 = v510:get_player_weapon();
            if not v511 then
                return;
            else
                if v511:get_weapon_info().is_revolver and v134.helpers.fixrevo:get() then
                    v18.hslag:override("Favor Fake Lag");
                    v509.is_revving = true;
                end;
                return;
            end;
        end;
    end, 
    inbicators = function(v512)
        -- upvalues: v134 (ref), v17 (ref), v18 (ref)
        if not v134.helpers.indicators:get() then
            return;
        elseif (not v134.helpers.indicators.on_peek:get() or not entity.get_threat(true)) and not entity.get_threat() then
            return;
        else
            local v513 = 0;
            if v512.is_revving and v134.helpers.indicators.options:get("revo") then
                render.text(2, vector(v17.size.x / 2 + 5, v17.size.y / 2 - 100 - v513 * 10), v18.hideshots:get() and color(255, 255, 255) or v134.accent.color:get(), "", ("revolver"):upper());
                v513 = v513 + 1;
            end;
            if v512.zeus_fixing and v134.helpers.indicators.options:get("zeus") then
                render.text(2, vector(v17.size.x / 2 + 5, v17.size.y / 2 - 100 - v513 * 10), color(255, 255, 255), "", ("zeus"):upper());
                v513 = v513 + 1;
            end;
            if v512.is_baiming and v134.helpers.indicators.options:get("baim") then
                render.text(2, vector(v17.size.x / 2 + 5, v17.size.y / 2 - 100 - v513 * 10), color(255, 255, 255), "", ("baim: " .. tostring(v512.baiming_value)):upper());
                v513 = v513 + 1;
            end;
            if v512.is_saving and v134.helpers.indicators.options:get("safe") then
                render.text(2, vector(v17.size.x / 2 + 5, v17.size.y / 2 - 100 - v513 * 10), color(255, 255, 255), "", ("safe"):upper());
                v513 = v513 + 1;
            end;
            if v512.js_type ~= 0 and v134.helpers.indicators.options:get("jumpscout hitchance") then
                render.text(2, vector(v17.size.x / 2 + 5, v17.size.y / 2 - 100 - v513 * 10), color(255, 255, 255), "", (v512.js_type == 1 and "jump" or "jump hc: " .. tostring(v512.js_hc)):upper());
                v513 = v513 + 1;
            end;
            return;
        end;
    end
};
local v542 = {
    switch_time_scale = 0, 
    switch_end = 0, 
    switch_time = 0, 
    last_wep = false, 
    wep_switched = false, 
    main = render.load_font("Segoe UI Black", 35, " a"), 
    render_inventory = function(v515)
        -- upvalues: v134 (ref), v59 (ref), v17 (ref)
        if not v134.visuals.customs:get() then
            return;
        else
            local v516 = v134.visuals.customs.color:get();
            local v517 = entity.get_local_player();
            if not v517 or not v517:is_alive() then
                return;
            else
                local v518 = v517:get_player_weapon(true);
                local v519 = v517:get_player_weapon();
                local v520 = {};
                local v521 = {
                    [0] = {
                        [1] = "KNIFE", 
                        [2] = 3
                    }, 
                    [1] = {
                        [1] = "PISTOL", 
                        [2] = 2
                    }, 
                    [2] = {
                        [1] = "SMG", 
                        [2] = 1
                    }, 
                    [3] = {
                        [1] = "RIFLE", 
                        [2] = 1
                    }, 
                    [4] = {
                        [1] = "SHOTGUN", 
                        [2] = 1
                    }, 
                    [5] = {
                        [1] = "SNIPER", 
                        [2] = 1
                    }, 
                    [6] = {
                        [1] = "MACHINE_GUN", 
                        [2] = 1
                    }, 
                    [7] = {
                        [1] = "C4", 
                        [2] = 6
                    }, 
                    [8] = {
                        [1] = "GRENADE", 
                        [2] = 4
                    }, 
                    [9] = {
                        [1] = "EQUIPMENT", 
                        [2] = 5
                    }, 
                    [10] = {
                        [1] = "STACKABLE_ITEM", 
                        [2] = 7
                    }
                };
                local v522 = {
                    weapon_smokegrenade = 3, 
                    weapon_flashbang = 2, 
                    weapon_hegrenade = 1, 
                    weapon_incgrenade = 5, 
                    weapon_molotov = 5, 
                    weapon_decoy = 4
                };
                for v523 = 1, #v518 do
                    local v524 = {
                        data = v518[v523], 
                        type = v518[v523]:get_weapon_info().weapon_type, 
                        priority = v521[v518[v523]:get_weapon_info().weapon_type][2], 
                        name = v518[v523]:get_weapon_info().weapon_name, 
                        selected = v518[v523]:get_weapon_info().weapon_name == v519:get_weapon_info().weapon_name
                    };
                    local v525 = false;
                    if not v520[1] then
                        table.insert(v520, 1, v524);
                        v525 = true;
                    end;
                    for v526 = 1, #v520 do
                        if not v520[v526] then
                            table.insert(v520, v526, v524);
                            v525 = true;
                        elseif v518[v523]:get_weapon_info().weapon_type == 9 and v520[v526].type == 9 then
                            if v522[v518[v523]:get_weapon_info().weapon_name] < v522[v520[v526].data:get_weapon_info().weapon_name] then
                                table.insert(v520, v526, v524);
                                v525 = true;
                                break;
                            end;
                        elseif v520[v526].priority > v521[v518[v523]:get_weapon_info().weapon_type][2] then
                            table.insert(v520, v526, v524);
                            v525 = true;
                            break;
                        end;
                    end;
                    if not v525 then
                        v520[#v520 + 1] = v524;
                    end;
                end;
                local v527 = {};
                local v528 = 0;
                for _, _ in pairs(v527) do
                    v528 = v528 + 1;
                end;
                local v531 = false;
                local v532 = 0;
                local l_curtime_0 = globals.curtime;
                if v519:get_weapon_info().is_revolver then
                    v531 = math.max(v517.m_flNextAttack, v519.m_flNextPrimaryAttack, v519.m_flNextSecondaryAttack) < l_curtime_0;
                    v532 = v519.m_flNextPrimaryAttack;
                else
                    v531 = math.max(v517.m_flNextAttack, v519.m_flNextPrimaryAttack, v519.m_flNextSecondaryAttack) < l_curtime_0;
                    v532 = math.max(v517.m_flNextAttack, v519.m_flNextPrimaryAttack, v519.m_flNextSecondaryAttack);
                end;
                if v515.last_wep ~= v519:get_weapon_info().weapon_name then
                    v515.wep_switched = true;
                    v515.switch_time = v532 - l_curtime_0;
                    v515.switch_time = v532 - l_curtime_0;
                    v515.switch_end = v532;
                end;
                if v515.wep_switched then
                    v515.switch_time_scale = math.clamp((v532 - l_curtime_0) * v515.switch_time, 0, 1);
                end;
                if v531 or v532 < l_curtime_0 or v515.switch_end < l_curtime_0 then
                    v515.wep_switched = false;
                end;
                for v534, v535 in pairs(v520) do
                    local v536 = v59.animation:new(v535.name .. "_selected", v535.selected and 50 or 0, 10);
                    render.rect(vector(v17.size.x - v535.data:get_weapon_icon().width - 30, v17.size.y - 50 * v534 - 60), vector(v17.size.x, v17.size.y - 50 * v534 - 15), color(v536, v536, v536, 150));
                    if v535.selected then
                        render.rect(vector(v17.size.x - v535.data:get_weapon_icon().width - 30, v17.size.y - 50 * v534 - 17), vector(v17.size.x - (v515.wep_switched and (v535.data:get_weapon_icon().width - 30) * 2 * v515.switch_time_scale or 0), v17.size.y - 50 * v534 - 15), v516);
                    end;
                    render.texture(v535.data:get_weapon_icon(), vector(v17.size.x - 15 - v535.data:get_weapon_icon().width, v17.size.y - 50 * v534 - 50), v516);
                end;
                v515.last_wep = v519:get_weapon_info().weapon_name;
                return;
            end;
        end;
    end, 
    render_hp = function(v537)
        -- upvalues: v134 (ref), v17 (ref)
        if not v134.visuals.customs:get() then
            return;
        else
            local v538 = v134.visuals.customs.color:get();
            local v539 = entity.get_local_player();
            if not v539 or not v539:is_alive() then
                return;
            else
                local l_m_iHealth_3 = v539.m_iHealth;
                local l_m_ArmorValue_1 = v539.m_ArmorValue;
                render.rect(vector(0, v17.size.y - 50), vector(150, v17.size.y - 10), color(0, 0, 0, 150));
                render.rect(vector(0, v17.size.y - 12), vector(150 * (l_m_iHealth_3 / 100), v17.size.y - 10), v538);
                render.text(v537.main, vector(2, v17.size.y - 49), v538, "", "Health: " .. tostring(l_m_iHealth_3));
                render.rect(vector(160, v17.size.y - 50), vector(270, v17.size.y - 10), color(0, 0, 0, 150));
                render.rect(vector(160, v17.size.y - 12), vector(270, v17.size.y - 10), v538);
                render.text(v537.main, vector(162, v17.size.y - 49), v538, "", "Kev: " .. tostring(l_m_ArmorValue_1));
                return;
            end;
        end;
    end
};
local v585 = {
    progress = 0, 
    status = "idle", 
    state = "", 
    final_right = 0, 
    final_left = 0, 
    state_num = "", 
    idx = 0, 
    tasks = {}, 
    taskrecord = {}, 
    common = {}, 
    player_list = {}, 
    maxvalue = function(v543)
        local v544 = nil;
        for v545, v546 in pairs(v543) do
            if v544 == nil or v544 < v546 then
                v544 = v546;
                maxkey = v545;
            end;
        end;
        return maxkey;
    end, 
    angle_diff = function(v547, v548)
        local v549 = 0;
        v549 = math.fmod(v547 - v548, 360);
        if v548 < v547 then
            if v549 >= 180 then
                v549 = v549 - 360;
            end;
        elseif v549 <= -180 then
            v549 = v549 + 360;
        end;
        return v549;
    end, 
    yawto180 = function(v550)
        if v550 > 180 then
            return v550 - 360;
        else
            return v550;
        end;
    end, 
    yaw_to_player = function(v551, v552, v553)
        local v554 = entity.get_local_player();
        if not v554 or not v552 then
            return 0;
        else
            local v555 = v554:get_origin();
            local _ = render.camera_angles();
            local v557 = v552:get_origin();
            local v558 = -math.atan2(v557.x - v555.x, v557.y - v555.y) / 3.14 * 180 + 180 - (v553 and 90 or -90);
            if v558 >= 180 then
                v558 = -(360 - v558);
            end;
            return (v551.yawto180(v558));
        end;
    end, 
    check_state = function(_, v560)
        local v561 = v560.m_vecVelocity:length2d();
        local l_m_fFlags_4 = v560.m_fFlags;
        local v563 = bit.lshift(1, 1);
        local v564 = bit.lshift(1, 0);
        local v565 = "";
        local v566 = 0;
        if bit.band(l_m_fFlags_4, v564) == 1 and v561 > 3 and bit.band(l_m_fFlags_4, v563) == 0 then
            v565 = "move";
            v566 = 4;
        elseif bit.band(l_m_fFlags_4, v564) == 0 and bit.band(l_m_fFlags_4, v563) == 0 then
            v565 = "air";
            v566 = 7;
        elseif bit.band(l_m_fFlags_4, v564) == 0 then
            v565 = "air+c";
            v566 = 8;
        elseif bit.band(l_m_fFlags_4, v564) == 1 and v561 < 3 and bit.band(l_m_fFlags_4, v563) == 0 then
            v565 = "stand";
            v566 = 2;
        elseif bit.band(l_m_fFlags_4, v564) == 1 and bit.band(l_m_fFlags_4, v563) > 0.9 then
            v565 = "duck";
            v566 = 5;
        end;
        return {
            string = v565, 
            number = v566
        };
    end, 
    handle_tasks = function(v567)
        -- upvalues: v134 (ref), v30 (ref)
        if v567.tasks == nil then
            return;
        else
            for v568, v569 in pairs(v567.tasks) do
                if type(v569) == "table" then
                    if globals.tickcount >= v569.endtime + 2 then
                        v567.tasks[v568] = nil;
                        v567.status = "idle";
                        v567.progress = 100;
                        v567.final_left = v567.maxvalue(v567.taskrecord[v569.idx].left);
                        v567.final_right = v567.maxvalue(v567.taskrecord[v569.idx].right);
                        v134.antiaim.stealer.result:name(v567.maxvalue(v567.taskrecord[v569.idx].left) .. " left | right " .. v567.maxvalue(v567.taskrecord[v569.idx].right));
                        v567.taskrecord[v569.idx].right = {};
                        v567.taskrecord[v569.idx].left = {};
                        v134.antiaim.stealer.result:visibility(true);
                        v134.antiaim.stealer.confirm:visibility(true);
                        break;
                    else
                        local v570 = entity.get(v569.idx);
                        local l_y_3 = v570.m_angEyeAngles.y;
                        local l_z_1 = v570.m_angEyeAngles.z;
                        local v573 = v567:yaw_to_player(v570, true);
                        local v574 = v567.angle_diff(math.floor(l_y_3), math.floor(v573));
                        local v575 = v567:check_state(v570);
                        v567.taskrecord[v569.idx] = v567.taskrecord[v569.idx] and v567.taskrecord[v569.idx] or {};
                        if v570:is_dormant() then
                            v567.status = "target dormant";
                            v134.antiaim.stealer.result:visibility(true);
                            v134.antiaim.stealer.result:name("\aFF0000FF" .. v567.status);
                            v569.endtime = v569.endtime + 1;
                        elseif v567.state ~= v575.string then
                            v567.status = "waiting for state state";
                            v134.antiaim.stealer.result:visibility(true);
                            v134.antiaim.stealer.result:name("\aFF0000FF" .. v567.status);
                            v569.endtime = v569.endtime + 1;
                        else
                            v567.state_num = v575.number;
                            if v574 < -140 or v574 > 140 then
                                local v576 = entity.get_local_player();
                                if not v576:is_alive() then
                                    return;
                                else
                                    local v577 = v576:get_player_weapon();
                                    if not v577 then
                                        return;
                                    elseif v577:get_weapon_info().weapon_name == "weapon_knife" then
                                        v567.status = "anti backstab detected";
                                        v134.antiaim.stealer.result:visibility(true);
                                        v134.antiaim.stealer.result:name("\aFF0000FF" .. v567.status);
                                        v569.endtime = v569.endtime + 1;
                                        goto label0 --[[  false, false  ]];
                                    end;
                                end;
                            end;
                            if not v567.taskrecord[v569.idx].old_yaw then
                                v567.taskrecord[v569.idx].old_yaw = v574;
                            elseif math.abs(math.abs(v567.taskrecord[v569.idx].old_yaw) - math.abs(v574)) < 5 and (v574 > 90 or v574 < -90) then
                                v567.status = "waiting for at target";
                                v134.antiaim.stealer.result:visibility(true);
                                v134.antiaim.stealer.result:name("\aFF0000FF" .. v567.status);
                                v569.endtime = v569.endtime + 1;
                            else
                                local _ = v567.taskrecord[v569.idx].old_yaw - v574;
                                local v579 = v30:is_active(v570) == true and l_z_1 < 79;
                                local v580 = v30:is_active(v570) and v574 > 80;
                                local v581 = v30:is_active(v570) and v574 < -80;
                                local v582 = 0;
                                local v583 = 0;
                                local v584 = v579 or v580 or v581;
                                v567.taskrecord[v569.idx].old_yaw = v574;
                                if not v584 and v574 > 0 then
                                    v582 = v574;
                                elseif not v584 and v574 < 0 then
                                    v583 = v574;
                                end;
                                v567.taskrecord[v569.idx].right = v567.taskrecord[v569.idx].right and v567.taskrecord[v569.idx].right or {};
                                v567.taskrecord[v569.idx].left = v567.taskrecord[v569.idx].left and v567.taskrecord[v569.idx].left or {};
                                if v582 ~= 0 and v582 > 0 then
                                    v567.taskrecord[v569.idx].right[v582] = v567.taskrecord[v569.idx].right[v582] and v567.taskrecord[v569.idx].right[v582] + 1 or 1;
                                end;
                                if v583 ~= 0 and v583 < 0 then
                                    v567.taskrecord[v569.idx].left[v583] = v567.taskrecord[v569.idx].left[v583] and v567.taskrecord[v569.idx].left[v583] + 1 or 1;
                                end;
                                v567.status = "recording";
                                v567.progress = math.floor((4 - (v569.endtime - globals.tickcount) / 64) / 4 * 100 + 0.5);
                                v134.antiaim.stealer.result:visibility(false);
                                v134.antiaim.stealer.progress:name("Progress: " .. v567.progress .. "%");
                            end;
                        end;
                    end;
                end;
                ::label0::;
            end;
            return;
        end;
    end
};
local v603 = l_system_0.register({
    [1] = v134.hidden.dmg_x, 
    [2] = v134.hidden.dmg_y
}, vector(20, 15), "Mindmg", function(v586)
    -- upvalues: v134 (ref), v59 (ref), l_system_0 (ref), v18 (ref)
    if not v134.visuals.damage_indicator:get() then
        return;
    else
        local v587 = ui.get_mouse_position();
        local v588 = entity.get_local_player();
        if not globals.is_connected or not globals.is_in_game or not v588 or not v588:is_alive() then
            return;
        else
            if ui.get_alpha() > 0.9 then
                render.rect_outline(vector(v586.position.x - 3, v586.position.y - 1), vector(v586.position.x + 20, v586.position.y + 15), color(255, 255, 255, 150), 1, 5);
                if v587.x > v586.position.x - 3 and v587.x < v586.position.x + 20 and v587.y > v586.position.y - 1 and v587.y < v586.position.y + 15 then
                    if v59.is_right_clicking() then
                        v134.hidden.dmg_x:reset();
                        v134.hidden.dmg_y:reset();
                        l_system_0.on_config_load();
                    end;
                    if not v59.is_left_clicking() then
                        render.text(2, vector(v586.position.x - 35, v586.position.y + 15), color(255, 255, 255, 150), "", string.upper("MB2  to  reset  Position"));
                    end;
                end;
            end;
            local v589 = ui.get_binds();
            local v590 = false;
            local v591 = 0;
            for _, v593 in pairs(v589) do
                if v593.name == "Min. Damage" and v593.active then
                    v590 = true;
                    v591 = v593.value;
                end;
            end;
            local v594 = 0;
            local v595 = v134.visuals.damage_indicator.font:get() == "pixel" and 2 or 1;
            local v596 = v134.visuals.damage_indicator.lerp:get();
            local v597 = v134.visuals.damage_indicator.mods:get();
            local l_round_0 = v59.round;
            local l_animation_0 = v59.animation;
            local l_l_animation_0_0 = l_animation_0;
            l_animation_0 = l_animation_0.new;
            local v601 = "mindmg";
            local v602;
            if not v590 or not v591 then
                v602 = v18.mindmg:get();
            else
                v602 = v591;
            end;
            l_round_0 = l_round_0(l_animation_0(l_l_animation_0_0, v601, v602, 15));
            if not v590 or not v591 then
                l_animation_0 = v18.mindmg:get();
            else
                l_animation_0 = v591;
            end;
            if v597 == "transparent when off" then
                v594 = v59.animation:new("mindmg alpha", v590 and 220 or 100, 6);
            elseif v597 == "always" then
                v594 = 220;
            elseif v597 == "override only" then
                v594 = v590 and 220 or 0;
            end;
            render.text(v595, vector(v586.position.x, v586.position.y), color(255, 255, 255, v594), "l b", v596 and l_round_0 or l_animation_0);
            return;
        end;
    end;
end);
local v609 = l_system_0.register({
    [1] = v134.hidden.panel_x, 
    [2] = v134.hidden.panel_y
}, vector(100, 43), "Panel", function(v604)
    -- upvalues: v103 (ref), v134 (ref), v585 (ref), v59 (ref), l_system_0 (ref), v11 (ref)
    local v605 = "";
    local v606 = entity.get_local_player();
    local v607 = ui.get_mouse_position();
    if not v103 or not v103.state or not v103.state.name then
        return;
    elseif not v606 then
        return;
    else
        v605 = math.abs(v606.m_flPoseParameter[11] * 120 - 60);
        if not v134.visuals.panel:get() then
            return;
        else
            local v608 = v585.status ~= "idle" and 93 or 43;
            if ui.get_alpha() > 0.9 then
                render.rect_outline(vector(v604.position.x, v604.position.y), vector(v604.position.x + 100, v604.position.y + v608), color(255, 255, 255, 255), 1, 5);
                if v607.x > v604.position.x and v607.x < v604.position.x + 100 and v607.y > v604.position.y and v607.y < v604.position.y + v608 then
                    if v59.is_right_clicking() then
                        v134.hidden.panel_x:reset();
                        v134.hidden.panel_y:reset();
                        l_system_0.on_config_load();
                    end;
                    if not v59.is_left_clicking() then
                        render.text(2, vector(v604.position.x + 6, v604.position.y + v608 + 2), color(255, 255, 255, 150), "", string.upper("MB2  to  reset  Position"));
                    end;
                end;
            end;
            render.text(2, vector(v604.position.x + 5, v604.position.y), color(255, 255, 255, 255), "", string.upper("User : \a" .. v134.visuals.panel.color:get():to_hex() .. v11.user));
            render.text(2, vector(v604.position.x + 5, v604.position.y + 10), color(255, 255, 255, 255), "", string.upper("Version : \a" .. v134.visuals.panel.color:get():to_hex() .. v11.version));
            render.text(2, vector(v604.position.x + 5, v604.position.y + 20), color(255, 255, 255, 255), "", string.upper("Condition : \a" .. v134.visuals.panel.color:get():to_hex() .. v103.state.name));
            render.text(2, vector(v604.position.x + 5, v604.position.y + 30), color(255, 255, 255, 255), "", string.upper("Desync : \a" .. v134.visuals.panel.color:get():to_hex() .. math.floor(v605) .. "\194\176"));
            if v585.status == "idle" then
                return;
            else
                render.text(2, vector(v604.position.x + 5, v604.position.y + 50), color(255, 255, 255, 255), "", string.upper("-- \a" .. v134.visuals.panel.color:get():to_hex() .. "stealer \aFFFFFFFF --"));
                render.text(2, vector(v604.position.x + 5, v604.position.y + 80), color(255, 255, 255, 255), "", string.upper("state: \a" .. v134.visuals.panel.color:get():to_hex() .. v585.state));
                render.text(2, vector(v604.position.x + 5, v604.position.y + 60), color(255, 255, 255, 255), "", string.upper("progress: \a" .. v134.visuals.panel.color:get():to_hex() .. tostring(math.floor(v585.progress + 0.5)) .. "%"));
                render.text(2, vector(v604.position.x + 5, v604.position.y + 70), color(255, 255, 255, 255), "", string.upper("status: \a" .. v134.visuals.panel.color:get():to_hex() .. v585.status));
                return;
            end;
        end;
    end;
end);
local v631 = l_system_0.register({
    [1] = v134.hidden.solus_x, 
    [2] = v134.hidden.solus_y
}, vector(150, 70), "keybinds", function(v610)
    -- upvalues: v134 (ref), v59 (ref), v284 (ref)
    if not v134.visuals.solus:get() then
        return;
    else
        local v611 = v134.visuals.solus.color:get();
        local v612 = ui.get_binds();
        local v613 = globals.is_connected and globals.is_in_game;
        local _ = 0;
        local v615 = {};
        local v616 = 0;
        local v617 = 20;
        local v618 = 0;
        local v619 = 1;
        local v620 = {};
        if ui.get_alpha() > 0.5 then
            table.insert(v612, {
                name = "Menu Toggled", 
                active = true, 
                mode = 3
            });
        end;
        for _, v622 in pairs(v612) do
            v620[v622.name] = v620[v622.name] or {};
            v620[v622.name].alpha = v59.animation:new("kb_" .. v622.name .. "_alpha", v622.active and 1 or 0, 15);
            if v622.active or v620[v622.name].alpha > 0.05 then
                local l_x_1 = render.measure_text(v619, "s", v622.name).x;
                local v624 = v284[v622.mode];
                local v625 = {
                    name = v622.name, 
                    mode = v624, 
                    alpha = v620[v622.name].alpha
                };
                table.insert(v615, v625);
                if v620[v622.name].alpha > 0.5 and v616 < l_x_1 and l_x_1 then
                    v616 = l_x_1;
                end;
            end;
        end;
        local v626 = v59.animation:new("kb_alpha", (not (ui.get_alpha() <= 0.5) or v613 and #v615 > 0) and 1 or 0, 15);
        if v626 < 0.01 then
            v626 = 0;
        end;
        if v626 > 0.99 then
            v626 = 1;
        end;
        local v627 = 75 + v616;
        if m_width == nil then
            m_width = w;
        end;
        m_width = v59.animation:new("kb_width", v627, 15);
        w = math.floor(m_width + 0.5);
        local v628 = 18 * render.get_scale(2) - 18;
        v618 = v618 + #v615 * (18 * render.get_scale(2));
        local v629 = vector(v610.position.x, v610.position.y);
        render.rect(v629 + vector(0, 2), v629 + vector(w, 18 * render.get_scale(2)), color(17, 17, 17, math.floor(v626 * 40)));
        render.rect(v629, v629 + vector(w, 2), color(v611.r, v611.g, v611.b, math.floor(v626 * 255)));
        render.text(v619, vector(v610.position.x - render.measure_text(v619, "s", "keybinds").x / 2 + w / 2, v610.position.y + 4), color(255, 255, 255, math.floor(v626 * 255)), "s", "keybinds");
        for v630 = 1, #v615 do
            render.text(v619, vector(v610.position.x, v610.position.y + v628 + v617), color(255, 255, 255, math.clamp(math.abs(math.floor(v615[v630].alpha * 255)), 0, 255)), "s", v615[v630].name);
            render.text(v619, vector(v610.position.x + w - render.measure_text(v619, "s", v615[v630].mode).x - 8, v610.position.y + v628 + v617), color(255, 255, 255, math.clamp(math.abs(math.floor(v615[v630].alpha * 255)), 0, 255)), "s", "[" .. v615[v630].mode .. "]");
            v617 = v617 + math.floor(13 * v615[v630].alpha + 0.5);
        end;
        return;
    end;
end);
v134.addons.list:set_callback(function()
    -- upvalues: v149 (ref)
    v149:refresh();
end);
v134.misc.logs.notify:set_callback(function()
    -- upvalues: l_pui_0 (ref), v348 (ref)
    l_pui_0.colors.logs = v348.color;
    v348:push_notify(l_pui_0.string("Hit\a[logs]  ivg \r(94%)  in \a[logs] head  \r(head)  for \a[logs] 124  \r(132)  damage"), false, entity.get_local_player());
end);
v134.visuals.aspect.r1:set_callback(function()
    -- upvalues: v134 (ref)
    v134.visuals.aspect.amount:set(178);
end);
v134.visuals.aspect.r2:set_callback(function()
    -- upvalues: v134 (ref)
    v134.visuals.aspect.amount:set(125);
end);
v134.visuals.aspect.r3:set_callback(function()
    -- upvalues: v134 (ref)
    v134.visuals.aspect.amount:set(133);
end);
v134.config.save = v104.config:button("   \f<floppy-disk>   ", function()
    -- upvalues: v178 (ref)
    v178:save();
end, true);
v134.config.load = v104.config:button("               load config               ", function()
    -- upvalues: v178 (ref), l_system_0 (ref)
    v178:load();
    l_system_0.on_config_load();
end, true);
v134.config.delete = v104.config:button("   \aff0000ff\f<trash>   ", function()
    -- upvalues: v178 (ref)
    v178:delete();
end, true);
v134.config.delete2 = v104.config:button("   \aff0000ff\f<trash>   ", function()
    -- upvalues: v178 (ref)
    v178:delete_confirm();
end, false);
v134.config.export = v104.config:button("             export             ", function()
    -- upvalues: v178 (ref)
    v178.export();
end, true);
v134.config.import = v104.config:button("             import             ", function()
    -- upvalues: v178 (ref), l_system_0 (ref)
    v178.import();
    l_system_0.on_config_load();
end, true);
v134.config.delete2:visibility(false);
v134.antiaim.leater2:visibility(false);
v134.antiaim.stealselect:visibility(false);
v134.antiaim.stealer.confirm:visibility(false);
v134.antiaim.stealer.error:visibility(false);
v134.antiaim.stealer.result:visibility(false);
v134.antiaim.stealer.cancel:visibility(false);
v134.antiaim.stealer.progress:visibility(false);
v134.visuals.customs:set_callback(function()
    -- upvalues: v134 (ref)
    cvar.cl_drawhud:int(v134.visuals.customs:get() and 0 or 1);
end);
v134.antiaim.stealer.refresh:set_callback(function()
    -- upvalues: v149 (ref)
    v149:update_plist();
end);
v134.antiaim.stealer.steal:set_callback(function()
    -- upvalues: v134 (ref), v10 (ref), v585 (ref)
    if v134.antiaim.stealer.plist:list()[v134.antiaim.stealer.plist:get()] == "Empty" or v134.antiaim.stealer.plist:list() == {} then
        v10("Refresh the playerlist");
        print_dev("Refresh the playerlist");
        return;
    else
        for _, v633 in pairs(entity.get_players(true, true)) do
            if v134.antiaim.stealer.plist:list()[v134.antiaim.stealer.plist:get()] == v633:get_name() then
                v585.idx = v633:get_index();
                v585.state = v134.antiaim.stealselect:get();
                v585.tasks[#v585.tasks + 1] = {
                    state = v585.state, 
                    idx = v585.idx, 
                    starttime = globals.tickcount, 
                    endtime = globals.tickcount + 256
                };
                v134.antiaim.stealer.plist:disabled(true);
                v134.antiaim.stealer.steal:visibility(false);
                v134.antiaim.stealer.refresh:visibility(false);
                v134.antiaim.stealer.progress:visibility(true);
                v134.antiaim.stealer.cancel:visibility(true);
            end;
        end;
        return;
    end;
end);
v134.antiaim.stealer.cancel:set_callback(function()
    -- upvalues: v585 (ref), v134 (ref)
    v585.tasks = {};
    v134.antiaim.stealer.plist:disabled(false);
    v134.antiaim.stealer.steal:visibility(true);
    v134.antiaim.stealer.refresh:visibility(true);
    v134.antiaim.stealer.progress:visibility(false);
    v134.antiaim.stealer.result:visibility(false);
    v134.antiaim.stealer.confirm:visibility(false);
    v134.antiaim.stealer.cancel:visibility(false);
end);
v134.antiaim.stealer.confirm:set_callback(function()
    -- upvalues: v134 (ref), v585 (ref)
    v134.antiaim.stealer.plist:disabled(false);
    v134.antiaim.stealer.steal:visibility(true);
    v134.antiaim.stealer.refresh:visibility(true);
    v134.antiaim.stealer.progress:visibility(false);
    v134.antiaim.stealer.result:visibility(false);
    v134.antiaim.stealer.confirm:visibility(false);
    v134.antiaim.stealer.cancel:visibility(false);
    v134.builder[v585.state_num].default.yaw.left:set(v585.final_left);
    v134.builder[v585.state_num].default.yaw.right:set(v585.final_right);
end);
v134.antiaim.leater1:set_callback(function()
    -- upvalues: v149 (ref), v134 (ref)
    v149:hide_antiaim();
    v134.antiaim.leater1:visibility(false);
    v134.antiaim.leater2:visibility(true);
    v134.antiaim.select:visibility(false);
    v134.antiaim.stealselect:set(v134.antiaim.select:get());
    v134.antiaim.stealselect:visibility(true);
    v134.antiaim.stealer.plist:visibility(true);
    v134.antiaim.stealer.steal:visibility(true);
    v134.antiaim.stealer.refresh:visibility(true);
    v134.antiaim.stealer.progress:visibility(false);
    v134.antiaim.stealer.result:visibility(false);
    v134.antiaim.stealer.confirm:visibility(false);
    v134.antiaim.stealer.cancel:visibility(false);
end);
v134.antiaim.leater2:set_callback(function()
    -- upvalues: v149 (ref), v134 (ref)
    v149:show_antiaim();
    v134.antiaim.leater2:visibility(false);
    v134.antiaim.leater1:visibility(true);
    v134.antiaim.select:visibility(true);
    v134.antiaim.stealselect:set(v134.antiaim.select:get());
    v134.antiaim.stealselect:visibility(false);
    for _, v635 in pairs(v134.antiaim.stealer) do
        v635:visibility(false);
    end;
end);
v216:setup();
local v636 = {
    [1] = " ", 
    [2] = "l", 
    [3] = "lu", 
    [4] = "lum", 
    [5] = "lumi", 
    [6] = "lumin", 
    [7] = "lumina", 
    [8] = "luminar", 
    [9] = "luminari", 
    [10] = "luminaria", 
    [11] = "luminaria [ALPHA]"
};
({
    introdone = false, 
    introstart = globals.realtime, 
    update_sidebar = function(v637)
        -- upvalues: v134 (ref), v636 (ref)
        local v638 = globals.realtime - v637.introstart;
        local v639 = v134.accent.color:get();
        if v638 >= 4 then
            v637.introdone = true;
        end;
        if not v637.introdone then
            ui.sidebar("\a" .. v639:to_hex() .. v636[math.clamp(math.floor(to_ticks(v638 / 2) / #v636), 1, #v636)], "moon");
        else
            ui.sidebar("\a" .. v639:to_hex() .. "luminaria [ALPHA]", "moon-stars");
        end;
    end, 
    setup = function(v640)
        -- upvalues: v134 (ref), v304 (ref), v348 (ref), v216 (ref), v178 (ref), v542 (ref), v631 (ref), v609 (ref), v603 (ref), v225 (ref), v357 (ref), v385 (ref), v393 (ref), v402 (ref), v410 (ref), v459 (ref), v514 (ref), v414 (ref), v585 (ref), v103 (ref), v283 (ref), v457 (ref), v433 (ref), v421 (ref)
        v134.config.configlist:set_callback(function(v641)
            -- upvalues: v134 (ref)
            local v642 = v134.config.configlist:list();
            v134.config.configname:set(v642[v641:get()] and v642[v641:get()] or "");
            v134.config.delete2:visibility(false);
            utils.execute_after(0.3, function()
                -- upvalues: v134 (ref)
                v134.config.delete:visibility(true);
            end);
        end);
        events.render:set(function()
            -- upvalues: v640 (ref), v304 (ref), v348 (ref), v216 (ref), v178 (ref), v542 (ref), v631 (ref), v609 (ref), v603 (ref), v225 (ref), v357 (ref), v385 (ref), v393 (ref), v402 (ref), v410 (ref), v459 (ref), v514 (ref)
            v640:update_sidebar();
            v304:render_indicators();
            v348:handle();
            v304:render_watermark();
            if not v216.created then
                v178:refresh();
            end;
            if v216.visuals then
                v542:render_inventory();
                v542:render_hp();
                v631:update();
                v609:update();
                v603:update();
                v225.aspectratio();
                v225.viewmodel();
                v357:draw();
                v385:indicators();
                v393:handle();
                v402:handle();
            end;
            if v216.misc then
                v410:handle();
                v225.unluck_pingspike();
                v459.menu();
            end;
            if v216.helpers then
                v514:inbicators();
            end;
            if ui.get_alpha() > 0 then
                v216:antiaim_visibility();
            end;
        end);
        events.post_update_clientside_animation:set(function(v643)
            -- upvalues: v414 (ref)
            v414.breaker(v643);
        end);
        events.net_update_end:set(function()
            -- upvalues: v585 (ref)
            v585:handle_tasks();
        end);
        events.createmove:set(function(v644)
            -- upvalues: v103 (ref), v283 (ref), v216 (ref), v225 (ref), v414 (ref), v457 (ref), v514 (ref)
            v103:updatestate(v644);
            v283:run(v644);
            if v216.misc then
                v225:ladder(v644);
                v414.legs(v644);
                v457:handle(v644);
            end;
            if v216.helpers then
                v514:zeus_fix();
                v514:smart_baim();
                v514:smart_safe();
                v514:airstop();
                v514:revo_fix();
            end;
            if ui.get_alpha() > 0.5 then
                v644.in_attack = false;
                v644.in_attack2 = false;
            end;
        end);
        events.player_death:set(function(v645)
            -- upvalues: v433 (ref)
            v433:killsay(v645);
        end);
        events.grenade_thrown:set(function(v646)
            -- upvalues: v433 (ref), v459 (ref)
            v433:blind(v646);
            v459.throwing(v646);
        end);
        events.aim_fire:set(function(v647)
            -- upvalues: v283 (ref), v348 (ref)
            v283.shot_choke = 2;
            v348:shot(v647);
        end);
        events.aim_ack:set(function(...)
            -- upvalues: v216 (ref), v348 (ref)
            if not v216.misc then
                return;
            else
                v348:result((...));
                return;
            end;
        end);
        events.round_prestart:set(function(...)
            -- upvalues: v348 (ref)
            utils.execute_after(1, function()
                -- upvalues: v348 (ref)
                v348.db = {};
            end);
        end);
        events.round_start:set(function()
            -- upvalues: v348 (ref)
            v348:remove_notify();
        end);
        events.player_connect_full:set(function(v648)
            -- upvalues: v348 (ref), v283 (ref)
            if entity.get(v648.userid, true) == entity.get_local_player() then
                v348:remove_notify();
                v283:reset_builder();
            end;
        end);
        events.player_spawned:set(function(...)
            -- upvalues: v357 (ref)
            v357:spawn(...);
        end);
        events.player_hurt:set(function(...)
            -- upvalues: v357 (ref)
            v357:hit(...);
        end);
        events.localplayer_transparency:set(function(v649)
            -- upvalues: v421 (ref)
            return v421:model(v649);
        end);
        events.shutdown:set(function()
            cvar.cl_drawhud:int(1);
        end);
    end
}):setup();
v16:check();
utils.execute_after(0.1, l_system_0.on_config_load);
utils.execute_after(0.1, function()
    -- upvalues: v216 (ref)
    v216:update_addons();
end);
utils.execute_after(0.2, function()
    -- upvalues: l_pui_0 (ref), v134 (ref)
    l_pui_0.setup(v134);
    for _, v651 in pairs(v134.antiaim.stealer) do
        v651:visibility(false);
    end;
end);