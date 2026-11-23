import LiveScripts.Shared
import LiveScripts.S_7f43715625aaa0eabb1e1e5cea42ed8ca9665a16ad730b5ae7b8982e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7f43715625aaa0eabb1e1e5cea42ed8ca9665a16ad730b5ae7b8982e.script [ctx] 10000]
