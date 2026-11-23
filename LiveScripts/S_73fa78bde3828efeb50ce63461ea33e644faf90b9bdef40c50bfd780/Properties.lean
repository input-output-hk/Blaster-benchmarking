import LiveScripts.Shared
import LiveScripts.S_73fa78bde3828efeb50ce63461ea33e644faf90b9bdef40c50bfd780.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_73fa78bde3828efeb50ce63461ea33e644faf90b9bdef40c50bfd780.script [ctx] 10000]
