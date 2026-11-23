import LiveScripts.Shared
import LiveScripts.S_c0fe1d56953c8730697e3ed83915f85a3c11013dc8fe608b971518a4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c0fe1d56953c8730697e3ed83915f85a3c11013dc8fe608b971518a4.script [ctx] 10000]
