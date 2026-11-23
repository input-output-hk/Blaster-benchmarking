import LiveScripts.Shared
import LiveScripts.S_077d1dc97ff465aa817f859b722b342355c98603b6d2cb51be2e5c9a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_077d1dc97ff465aa817f859b722b342355c98603b6d2cb51be2e5c9a.script [ctx] 10000]
